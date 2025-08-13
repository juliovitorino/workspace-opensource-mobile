import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/find_all_training_session_calendar_request_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/last_training_session_storage_service.dart';
import 'package:treinadorpro/core/provider/training_session_provider.dart';
import 'package:treinadorpro/core/utils/alert.dart';
import 'package:treinadorpro/core/widgets/pro_widget_booking_view_calendar.dart';
import 'package:treinadorpro/core/widgets/pro_widget_circle_subtitles.dart';
import 'package:treinadorpro/core/widgets/pro_widget_custom_loading_indicator.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/blocs/booking_training_session_cubit.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/booking_detail_view_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/last_training_summary_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/training_page.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/contract_response_model.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/user_training_session_model.dart';
import '../../../../core/data/models/user_workout_plan_model.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_data_sheet_plan_storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/miscelaneous.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_info_row.dart';
import '../../../../core/widgets/pro_widget_section_title.dart';
import '../../../../core/widgets/pro_widget_tag.dart';

class BookingViewPage extends ConsumerStatefulWidget {
  const BookingViewPage({super.key});

  @override
  ConsumerState<BookingViewPage> createState() => _BookingViewPageState();
}

class _BookingViewPageState extends ConsumerState<BookingViewPage> {
  late final ITrainingSessionRepository _trainingSessionRepository;
  late final AppConfig config;
  late Map<String, List<UserWorkoutPlanModel>> userWorkoutPlanData;
  late String _contractToken;
  late Future<UserTrainingSessionModel?> _userTrainingSessionModelFuture;

  late List<UserTrainingSessionModel?> _trainingSessionList;
  late UserTrainingSessionModel? _userTrainingSessionModel;
  late DateTime startDate;
  late DateTime endDate;

  List<UserWorkoutPlanModel>? exerciseList;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userPlanDraft = UserDataSheetPlanStorageService();

  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
      UserTrainingSessionStorageService();
  final KeyStorageService<UserTrainingSessionModel> _lastTrainingSessionStorage =
      LastTrainingSessionStorageService();

  final List<DateTime> _selectedDate = [];

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    userWorkoutPlanData = {};
    _trainingSessionRepository = ref.read(trainingSessionRepositoryProvider);
    startDate = getFirstDayAtMidnight(DateTime.now());
    endDate = getEndOfMonth(DateTime.now());

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      _userTrainingSessionModelFuture = _userTrainingSessionStorage.get(_contractToken);

      _initData();

      print('_contractToken => $_contractToken');
      ref.read(findContractViewModelProvider.notifier).findContract(_contractToken);

      ref
          .read(findUserWorkoutDataSheetPlanViewModelProvider.notifier)
          .findUserWorkoutDataSheetPlan(_contractToken);
    }); //END Future.microtask
  }

  void _initData() async {
    ref
        .read(findAllTrainingSessionCalendarViewModelProvider.notifier)
        .findAllTrainingSessionCalendar(
          FindAllTrainingSessionCalendarRequestModel(_contractToken, startDate, endDate),
        );
  }

  Widget _buildCard(ContractResponseModel contract) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: ProWidgetSectionTitle(title: contract.studentUser.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProWidgetInfoRow(label: 'Objetivo', value: contract.description),
              ProWidgetInfoRow(
                label: 'Valor combinado',
                value: '${contract.currency} \$ ${contract.price.toStringAsFixed(2)}',
              ),
              ProWidgetInfoRow(label: 'Pacote', value: contract.trainingPack.description),
              ProWidgetInfoRow(label: 'Modalidade', value: contract.trainingPack.modality!.namePt),
              ProWidgetInfoRow(label: 'Local do Treino', value: contract.workoutSite!),
              ProWidgetInfoRow(label: 'Contratado em', value: getDateTimeToDT(contract.createdAt)),
              ProWidgetInfoRow(
                label: 'Status',
                value: '...',
                widget: ProWidgetTag(
                  text: getContractStatus(contract.status) ?? contract.status,
                  borderColor: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 8, height: 10),

              buildDays(contract),
              SizedBox(width: 8, height: 10),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildTrainingSessionCalendar() {
    return ProWidgetBookingViewCalendar(
      trainingSessionList: _trainingSessionList,
      onDatePressed: (trainingSession) async {
        if (trainingSession != null) {
          if (trainingSession.progressStatus == 'FINISHED') {
            trainingSession.userWorkoutPlanList?.forEach((e) => e.trainingStatus = 'DONE');
            await _lastTrainingSessionStorage.save(trainingSession, _contractToken);
            Navigator.push(context, MaterialPageRoute(builder: (_) => LastTrainingSummaryPage()));
          }
          if (trainingSession.progressStatus == 'BOOKING') {
            if (getDateTimeToDate(DateTime.now()) == getDateTimeToDate(trainingSession.booking!)) {
              showAlertDialog(
                context,
                'Vamos Treinar Agora?',
                () async {
                  Navigator.of(context).pop();
                  trainingSession.progressStatus = 'STARTED';
                  trainingSession.startedAt = DateTime.now();
                  trainingSession.bookingExternalId = trainingSession.externalId;
                  await _userTrainingSessionStorage.save(trainingSession, _contractToken);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TrainingPage())).then((
                    onValue,
                  ) {
                    setState(() async {
                      trainingSession.progressStatus = 'BOOKING';
                      _initData();
                    });
                  });
                },
                () {
                  Navigator.of(context).pop();
                },
              );
            } else {
              // trainingSession.userWorkoutPlanList?.forEach((e) => e.trainingStatus = 'DONE');
              await _userTrainingSessionStorage.save(trainingSession, _contractToken);
              Navigator.push(context, MaterialPageRoute(builder: (_) => BookingDetailViewPage())).then((
                onValue,
              ) {
                setState(() async {
                  if (onValue == 1) {
                    await _userTrainingSessionStorage.clear(_contractToken);
                    _trainingSessionList.remove(trainingSession);
                    _initData();
                  }
                });
              });
            }
          }
        }
      },
    );
  }

  Widget _buildFormArea(BuildContext context, HandlerState state, AppConfig config) {
    final contractState = ref.watch(findContractViewModelProvider);
    final trainingSessionState = ref.watch(findAllTrainingSessionCalendarViewModelProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: [
            // contract card
            contractState.when(
              data: (data) => _buildCard(data.objectResponse),
              error: (e, _) => Text('Error: $e'),
              loading: () => CircularProgressIndicator(),
            ),

            // training session calendar
            trainingSessionState.when(
              data: (data) {
                _trainingSessionList = data.objectResponse;
                // return _buildTrainingSessionCalendar(_trainingSessionList);
                return _buildTrainingSessionCalendar();
              },
              error: (e, _) => Text('Error: $e'),
              loading: () => ProWidgetCustomLoadingIndicator(),
            ),

            // subtitles for calendar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProWidgetCircleSubtitles(cor: Colors.green, texto: 'Treino Executado'),
                SizedBox(width: 10),
                ProWidgetCircleSubtitles(cor: Colors.blue, texto: 'Treino Agendado'),
                SizedBox(width: 10),
                ProWidgetCircleSubtitles(cor: Colors.grey, texto: 'Dia Livre'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _processFormListenerFromCubitStateChanged(
    BuildContext context,
    HandlerState state,
  ) async {
    if (state.errorMessage != null) {
      final ExceptionApiModel exceptionApiModel = state.objectResponse as ExceptionApiModel;

      print("statusCode = ${exceptionApiModel.statusCode}");
      print("msgcode = ${exceptionApiModel.msgcode}");
      print("message = ${exceptionApiModel.message}");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      showAlertCloseDialog(context, 'Treino foi agendado com sucesso', () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingTrainingSessionCubit(_trainingSessionRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('AGENDA DE TREINOS'),
          actions: [ProWidgetInfoAlertDialog(title: 'page', text: 'booking_view_page.dart')],
        ),
        body: BlocConsumer<BookingTrainingSessionCubit, HandlerState>(
          builder: (context, state) => _buildFormArea(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}

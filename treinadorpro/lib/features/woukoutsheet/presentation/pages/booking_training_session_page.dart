import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/itraining_session_datasource.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/domain/repositories/training_session_repository.dart';
import 'package:treinadorpro/core/widgets/pro_widget_monthly_calendar.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/booking_model_request.dart';
import '../../../../core/data/models/contract_response_model.dart';
import '../../../../core/data/models/user_training_session_model.dart';
import '../../../../core/data/models/user_workout_plan_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_data_sheet_plan_storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/miscelaneous.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/pro_widget_info_row.dart';
import '../../../../core/widgets/pro_widget_section_title.dart';
import '../../../../core/widgets/pro_widget_tag.dart';

class BookingTrainingSessionPage extends ConsumerStatefulWidget {
  const BookingTrainingSessionPage({super.key});

  @override
  ConsumerState<BookingTrainingSessionPage> createState() => _BookingTrainingSessionPageState();
}

class _BookingTrainingSessionPageState extends ConsumerState<BookingTrainingSessionPage> {
  late final AppConfig config;
  late Map<String, List<UserWorkoutPlanModel>> userWorkoutPlanData;
  late String _contractToken;
  late Future<UserTrainingSessionModel?> _userTrainingSessionModelFuture;
  late UserTrainingSessionModel? _userTrainingSessionModel;

  List<UserWorkoutPlanModel>? exerciseList;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userPlanDraft = UserDataSheetPlanStorageService();
  final KeyStorageService<List<UserWorkoutPlanModel>> _userTrainingStorage =
  UserTrainingStorageService();
  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
  UserTrainingSessionStorageService();

  final List<DateTime> _selectedDate = [];

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    userWorkoutPlanData = {};

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      _userTrainingSessionModelFuture = _userTrainingSessionStorage.get(_contractToken);

      print('_contractToken => $_contractToken');
      ref.read(findContractViewModelProvider.notifier).findContract(_contractToken);

      ref
          .read(findUserWorkoutDataSheetPlanViewModelProvider.notifier)
          .findUserWorkoutDataSheetPlan(_contractToken);
    }); //END Future.microtask
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

  Widget _buildMessagebuilder(BuildContext context,
      AsyncSnapshot<UserTrainingSessionModel?> snapshot,) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('Nenhum dado encontrado.'));
    } else {
      // Now... we have data and we can call method
      _userTrainingSessionModel = snapshot.data!;
      return Text('Treino carregado');
    }
  }

  @override
  Widget build(BuildContext context) {
    final contractState = ref.watch(findContractViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('AGENDAR TREINO')),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery
              .of(context)
              .size
              .height),
          child: Column(
            children: [
              // contract card
              contractState.when(
                data: (data) => _buildCard(data.objectResponse),
                error: (e, _) => Text('Error: $e'),
                loading: () => CircularProgressIndicator(),
              ),

              FutureBuilder(
                future: _userTrainingSessionModelFuture,
                builder: (context, snapshot) => _buildMessagebuilder(context, snapshot),
              ),

              // monthly calendar
              ProWidgetMonthlyCalendar(
                onDateSelected: (date) => _selectedDate.add(date),
                onDateUnselected: (date) => _selectedDate.remove(date),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            final request = BookingModelRequest(contractExternalId: _contractToken,
                bookingList: _selectedDate,
                trainingSession: _userTrainingSessionModel!);
          },
          icon: Icon(Icons.check),
          label: Text('SALVAR AGENDA DE TREINO'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: Size.fromHeight(50),
          ),
        ),
      ),
    );
  }
}

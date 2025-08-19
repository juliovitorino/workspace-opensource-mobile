import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/contract_response_model.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/training_time_model.dart';
import '../../../../core/data/requests/contract_schedule_modifier_request_model.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/user_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/utils/alert.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/global.dart';
import '../../../../core/widgets/pro_widget_dropdown_label.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_info_row.dart';
import '../../../../core/widgets/pro_widget_section_title.dart';
import '../../../../core/widgets/pro_widget_tag.dart';
import '../../../dashboard/presentation/widgets/pro_widget_free_available_time.dart';
import '../blocs/contract_schedule_edit_page_cubit.dart';

class ContractScheduleEditPage extends ConsumerStatefulWidget {
  const ContractScheduleEditPage({super.key});

  @override
  ConsumerState<ContractScheduleEditPage> createState() => _ContractScheduleEditPageState();
}

class _ContractScheduleEditPageState extends ConsumerState<ContractScheduleEditPage> {
  late final IContractRespository _contractRespository;
  late final AppConfig config;
  late TrainingTimeModel _mondayController;
  late TrainingTimeModel _tuesdayController;
  late TrainingTimeModel _wednesdayController;
  late TrainingTimeModel _thursdayController;
  late TrainingTimeModel _fridayController;
  late TrainingTimeModel _saturdayController;
  late TrainingTimeModel _sundayController;

  late String _contractToken;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final List<TrainingTimeModel> _trainingTimeModel = [
    TrainingTimeModel('- x -'),
    TrainingTimeModel('05:00'),
    TrainingTimeModel('06:00'),
    TrainingTimeModel('07:00'),
    TrainingTimeModel('08:00'),
    TrainingTimeModel('09:00'),
    TrainingTimeModel('10:00'),
    TrainingTimeModel('11:00'),
    TrainingTimeModel('12:00'),
    TrainingTimeModel('13:00'),
    TrainingTimeModel('14:00'),
    TrainingTimeModel('15:00'),
    TrainingTimeModel('16:00'),
    TrainingTimeModel('17:00'),
    TrainingTimeModel('18:00'),
    TrainingTimeModel('19:00'),
    TrainingTimeModel('20:00'),
    TrainingTimeModel('21:00'),
    TrainingTimeModel('22:00'),
    TrainingTimeModel('23:00'),
  ];

  bool _isShowAvailableTime = false;
  bool _isCustomScheduleStarted = false;
  String _labelButtonAvailableTime = 'Mostrar agenda de horários disponíveis';

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    _contractRespository = ref.read(contractRepositoryProvider);

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      print('$_contractToken loaded from contract_schedule_edit_page');
      ref.read(findContractViewModelProvider.notifier).findContract(_contractToken);

      ref.read(findTrainerAvailableTimeViewModelProvider.notifier).findTrainerAvailableTime();
    }); //END Future.microtask
  }

  Widget _buildCustomSchedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _mondayController,
          items: _trainingTimeModel,
          label: 'Segunda-feira',
          onChanged: (value) => setState(() => _mondayController = value!),
        ),
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _tuesdayController,
          items: _trainingTimeModel,
          label: 'Terça-feira',
          onChanged: (value) => setState(() => _tuesdayController = value!),
        ),
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _wednesdayController,
          items: _trainingTimeModel,
          label: 'Quarta-feira',
          onChanged: (value) => setState(() => _wednesdayController = value!),
        ),
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _thursdayController,
          items: _trainingTimeModel,
          label: 'Quinta-feira',
          onChanged: (value) => setState(() => _thursdayController = value!),
        ),
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _fridayController,
          items: _trainingTimeModel,
          label: 'Sexta-feira',
          onChanged: (value) => setState(() => _fridayController = value!),
        ),
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _saturdayController,
          items: _trainingTimeModel,
          label: 'Sábado',
          onChanged: (value) => setState(() => _saturdayController = value!),
        ),
        ProWidgetDropdownLabel<TrainingTimeModel>(
          value: _sundayController,
          items: _trainingTimeModel,
          label: 'Domingo',
          onChanged: (value) => setState(() => _sundayController = value!),
        ),
      ],
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
                  text: decodeStatus(contract.status) ?? contract.status,
                  borderColor: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 8, height: 10),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildFormArea(BuildContext context, HandlerState state, AppConfig config) {
    final contractState = ref.watch(findContractViewModelProvider);

    final trainerAvailableTimeState = ref.watch(findTrainerAvailableTimeViewModelProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // contract card
            contractState.when(
              data: (data) => _buildCard(data.objectResponse),
              error: (e, _) => Text('Error: $e'),
              loading: () => CircularProgressIndicator(),
            ),

            // contract schedule
            SizedBox(height: 16),
            contractState.when(
              data: (data) {
                print('contract schedule => ${data.objectResponse.externalId}');
                if(!_isCustomScheduleStarted){
                  _setDayOfWeekController(data.objectResponse);
                  _isCustomScheduleStarted = true;
                }
                return _buildCustomSchedule();
              },
              error: (e, _) => Text('Error: $e'),
              loading: () => CircularProgressIndicator(),
            ),

            //-------------------------------
            // available time data sheet
            //-------------------------------
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => setState(() {
                _isShowAvailableTime = !_isShowAvailableTime;
                if (_isShowAvailableTime) {
                  _labelButtonAvailableTime = 'Esconder agenda de horários';
                } else {
                  _labelButtonAvailableTime = 'Mostrar agenda de horários disponíveis';
                }
              }),
              icon: Icon(Icons.schedule),
              label: Text(_labelButtonAvailableTime),
            ),

            if (_isShowAvailableTime)
              trainerAvailableTimeState.when(
                data: (data) => ProWidgetFreeAvailableTime(data.objectResponse),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

            // action button
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                context.read<ContractScheduleEditPageCubit>().changeSchedule(
                  _contractToken,
                  ContractScheduleModifierRequestModel(
                    contractExternalId: _contractToken,
                    monday: getTrainingTime(_mondayController),
                    tuesday: getTrainingTime(_tuesdayController),
                    wednesday: getTrainingTime(_wednesdayController),
                    thursday: getTrainingTime(_thursdayController),
                    friday: getTrainingTime(_fridayController),
                    saturday: getTrainingTime(_saturdayController),
                    sunday: getTrainingTime(_sundayController)
                  ),
                );
              },
              icon: Icon(Icons.schedule),
              label: Text('SALVAR HORÁRIOS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? getTrainingTime(TrainingTimeModel trainingTimeModel){
    return trainingTimeModel.trainingTime == '- x -' ? null : trainingTimeModel.trainingTime;
  }

  void _setDayOfWeekController(ContractResponseModel contract) {
    print('_setDayOfWeekController => contract ${contract.externalId}');
    _mondayController = _trainingTimeModel.firstWhere(
      (element) => contract.monday != null && element.trainingTime == contract.monday!,
      orElse: () => _trainingTimeModel.first,
    );

    _tuesdayController = _trainingTimeModel.firstWhere(
      (element) => contract.tuesday != null && element.trainingTime == contract.tuesday!,
      orElse: () => _trainingTimeModel.first,
    );

    _wednesdayController = _trainingTimeModel.firstWhere(
      (element) => contract.wednesday != null && element.trainingTime == contract.wednesday!,
      orElse: () => _trainingTimeModel.first,
    );

    _thursdayController = _trainingTimeModel.firstWhere(
      (element) => contract.thursday != null && element.trainingTime == contract.thursday!,
      orElse: () => _trainingTimeModel.first,
    );

    _fridayController = _trainingTimeModel.firstWhere(
      (element) => contract.friday != null && element.trainingTime == contract.friday!,
      orElse: () => _trainingTimeModel.first,
    );

    _saturdayController = _trainingTimeModel.firstWhere(
      (element) => contract.saturday != null && element.trainingTime == contract.saturday!,
      orElse: () => _trainingTimeModel.first,
    );

    _sundayController = _trainingTimeModel.firstWhere(
      (element) => contract.sunday != null && element.trainingTime == contract.sunday!,
      orElse: () => _trainingTimeModel.first,
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
      create: (_) => ContractScheduleEditPageCubit(_contractRespository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ALTERAR HORÁRIO'),
          actions: [
            ProWidgetInfoAlertDialog(title: 'page', text: 'contract_schedule_edit_page.dart'),
          ],
        ),
        body: BlocConsumer<ContractScheduleEditPageCubit, HandlerState>(
          builder: (context, state) => _buildFormArea(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}

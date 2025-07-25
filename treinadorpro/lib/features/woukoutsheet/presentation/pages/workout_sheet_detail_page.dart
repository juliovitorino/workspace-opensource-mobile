import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/widgets/pro_widget_pin.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/contract_response_model.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/goal_model.dart';
import '../../../../core/data/models/modality_model.dart';
import '../../../../core/data/models/program_model.dart';
import '../../../../core/data/models/user_data_sheet_plan_model.dart';
import '../../../../core/data/models/user_workout_plan_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_data_sheet_plan_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../blocs/build_workout_sheet_cubit.dart';
import '../widgets/workout_group_card.dart';

class WorkoutSheetDetailPage extends ConsumerStatefulWidget {
  const WorkoutSheetDetailPage({super.key});

  @override
  ConsumerState<WorkoutSheetDetailPage> createState() =>
      _WorkoutSheetDetailPageState();
}

class _WorkoutSheetDetailPageState
    extends ConsumerState<WorkoutSheetDetailPage> {
  late final IContractRespository _contractRespository;
  late final AppConfig config;
  late Map<String, List<UserWorkoutPlanModel>> userWorkoutPlanData;
  late String _contractToken;
  late ContractResponseModel _contract;
  late ModalityModel? _modality; // = Modality.modalities.first;
  late GoalModel? _goal; // = Goal.goals.first;
  late UserDataSheetPlanModel _userDataSheetSaved;

  ProgramModel? _program; // = Program.programs.first;


  final StorageService<String> _contractTokenStorage =
      ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userPlanDraft =
  UserDataSheetPlanStorageService();


  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    userWorkoutPlanData = {};

    // vai ser usado futuramente
    _contractRespository = ref.read(contractRepositoryProvider);

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      // _userModel = (await _trainerStorageService.get())!;
      // _draft = await _userPlanDraft.get(_contractToken);
      // if (_draft?.plan != null) {
      //   userWorkoutPlanData = _draft!.plan;
      // }
      ref
          .read(findContractViewModelProvider.notifier)
          .findContract(_contractToken);

      ref
          .read(findUserWorkoutDataSheetPlanViewModelProvider.notifier)
          .findUserWorkoutDataSheetPlan(_contractToken);
    });
  }

  Widget _buildForm(
    BuildContext context,
    HandlerState state,
    AppConfig config,
  ) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: _buildFormArea(state, context, config),
      ),
    );
  }

  Widget _buildContractCard(ContractResponseModel contract) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contract.studentUser.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              '${contract.description} • ${contract.trainingPack.description}',
            ),
            Text('📍 ${contract.workoutSite}'),

          ],
        ),
      ),
    );
  }

  Widget _buildFormArea(
    HandlerState state,
    BuildContext context,
    AppConfig config,
  ) {
    final userDataSheetState = ref.watch(
      findUserWorkoutDataSheetPlanViewModelProvider,
    );
    final contractState = ref.watch(findContractViewModelProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // student
          Text('Aluno'),
          contractState.when(
            data: (contract) {
              _contract = contract.objectResponse;
              return _buildContractCard(contract.objectResponse);
            },
            error: (e, _) => Center(child: Text('error: $e')),
            loading: () => Center(child: CircularProgressIndicator()),
          ),

          SizedBox(height: 16),
          ProWidgetPin(pinMessage: 'Selecione abaixo os treinos que você quer aplicar ao seu aluno'),
          SizedBox(height: 16),
          userDataSheetState.when(
              data: (data) => _buildExercisesListView(context, data.objectResponse),
              error: (e,_)=> Center(child: Text('error: $e')),
              loading: () => Center(child: CircularProgressIndicator())),

          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              _contractTokenStorage.save(_contract.externalId);
              _userPlanDraft.save(_userDataSheetSaved, _contract.externalId);
              Navigator.popAndPushNamed(context, AppRoutes.buildWorkout);
            },
            icon: Icon(Icons.check),
            label: Text('Modificar Ficha de Treino'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercisesListView(BuildContext context, UserDataSheetPlanModel data){
    final workoutEntries = data.plan.entries.toList();
    _modality = data.modality;
    _goal = data.goal;
    _program = data.program;
    _userDataSheetSaved = data;

    return
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(12),
        itemCount: workoutEntries.length,
        itemBuilder: (context, index) {
          final entry = workoutEntries[index];
          return WorkoutGroupCard(
            groupName: entry.key,
            exercises: entry.value,
            onDelete: (e) {
              setState(() {
                userWorkoutPlanData[e.workGroup.namePt]?.removeWhere(
                      (item) => item.control == e.control,
                );
                final _exercisesGroup =
                userWorkoutPlanData[e.workGroup.namePt];
                if (_exercisesGroup!.isEmpty) {
                  if (userWorkoutPlanData.containsKey(
                    e.workGroup.namePt,
                  )) {
                    userWorkoutPlanData.remove(e.workGroup.namePt);
                  }
                }
              });

              final draft = UserDataSheetPlanModel(
                contract: _contract,
                modality: _modality,
                goal: _goal,
                program: _program,
                plan: userWorkoutPlanData,
              );

              // _userPlanDraft.save(draft, _contract.externalId);
            },
          );
        },
      );
  }


  Future<void> _processFormListenerFromCubitStateChanged(
      BuildContext context,
      HandlerState state,
      ) async {
    if (state.errorMessage != null) {
      final ExceptionApiModel exceptionApiModel =
      state.objectResponse as ExceptionApiModel;

      print("statusCode = ${exceptionApiModel.statusCode}");
      print("msgcode = ${exceptionApiModel.msgcode}");
      print("message = ${exceptionApiModel.message}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Sucesso'),
          content: Text("Plano Salvo"),
        ),
      );

      // Navigator.popAndPushNamed(context, AppRoutes.workoutSheetPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuildWorkoutSheetCubit(_contractRespository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ficha de Treino'),
          actions: [
            ProWidgetInfoAlertDialog(
              title: 'page',
              text: 'workout_sheet_detail_page.dart',
            ),
          ],
        ),
        body: BlocConsumer<BuildWorkoutSheetCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) =>
              _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}

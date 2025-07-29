import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_training_storage_service.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../blocs/training_page_cubit.dart';

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({super.key});

  @override
  ConsumerState<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends ConsumerState<TrainingPage> {
  late final IContractRespository _contractRepository;
  late final AppConfig config;
  late String _contractToken;
  late Future<List<UserWorkoutPlanModel>?> _trainingListFuture;

  final StorageService<String> _contractTokenStorage =
      ContractTokenStorageService();
  final KeyStorageService<List<UserWorkoutPlanModel>> _trainingStorage =
      UserTrainingStorageService();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    // vai ser usado futuramente
    _contractRepository = ref.read(contractRepositoryProvider);

    _initData();
  }

  void _initData() async {
    _contractToken = (await _contractTokenStorage.get())!;
    setState(() {
      _trainingListFuture = _trainingStorage.get(_contractToken);
    });
  }

  Widget _buildExercisesListView(List<UserWorkoutPlanModel>? _trainingList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: _trainingList?.length,
      itemBuilder: (context, index) {
        final training = _trainingList?[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 12),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(training!.workGroup.namePt, style: TextStyle(fontWeight: FontWeight.bold)),
                ListTile(
                  title: Text(
                    training?.customExercise ?? training?.exercise?.namePt ?? 'Exercício',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${training?.qtySeries}x${training?.qtyReps} • Tempo: ${training?.executionTime}m • descanso: ${training?.restTime}m',
                      ),
                      SizedBox(height: 8),
                      Chip(label: Text(training!.executionMethod.toString())),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFormArea(
    HandlerState state,
    BuildContext context,
    AppConfig config,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // student
          // contractState.when(
          //   data: (contract) {
          //     _contract = contract.objectResponse;
          //     return _buildContractCard(contract.objectResponse);
          //   },
          //   error: (e, _) => Center(child: Text('error: $e')),
          //   loading: () => Center(child: CircularProgressIndicator()),
          // ),

          // exercise list - avoid late initialization
          FutureBuilder<List<UserWorkoutPlanModel>?>(
            future: _trainingListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('Nenhum dado encontrado.'));
              } else {
                // Agora temos os dados, podemos chamar o método que recebe a lista
                return _buildExercisesListView(snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
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
        builder: (_) =>
            AlertDialog(title: Text('Sucesso'), content: Text("Plano Salvo")),
      );

      // Navigator.popAndPushNamed(context, AppRoutes.workoutSheetPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingPageCubit(_contractRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Treino'),
          actions: [
            if (config.isDebugMode)
              ProWidgetInfoAlertDialog(
                title: 'page',
                text: 'training_page.dart',
              ),
          ],
        ),
        body: BlocConsumer<TrainingPageCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) =>
              _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}

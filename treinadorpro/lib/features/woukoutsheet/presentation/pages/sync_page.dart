import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/provider/training_session_provider.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/blocs/sync_page_cubit.dart';

import '../../../../config/app_config.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/user_training_session_model.dart';
import '../../../../core/data/models/user_workout_plan_model.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';

class SyncPage extends ConsumerStatefulWidget {
  const SyncPage({super.key});

  @override
  ConsumerState<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends ConsumerState<SyncPage> {
  late final AppConfig config;
  late final ITrainingSessionRepository _repository;
  late String _contractToken;
  late Future<UserTrainingSessionModel?> _userTrainingSessionModelFuture;
  late UserTrainingSessionModel _userTrainingSessionInstance;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
      UserTrainingSessionStorageService();

  final _formKey = GlobalKey<FormState>();
  bool _syncStarted = false;

  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    _repository = ref.read(trainingSessionRepositoryProvider);

    _initData();
  }

  void _initData() async {
    _contractToken = (await _contractTokenStorage.get())!;
    setState(() {
      _userTrainingSessionModelFuture = _userTrainingSessionStorage.get(_contractToken);
    });
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sync, color: Colors.green, size: 30),
                SizedBox(width: 8),
                Text(
                  'Sincronizando Dados...',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Celular
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.smartphone, size: 30), SizedBox(width: 12), Text('Celular')],
            ),
            const SizedBox(height: 16),

            // Flecha
            const Icon(Icons.arrow_downward, size: 24),
            const SizedBox(height: 16),

            // Internet
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.public, size: 30), SizedBox(width: 12), Text('Internet')],
            ),
            const SizedBox(height: 16),

            // Flecha
            const Icon(Icons.arrow_downward, size: 24),
            const SizedBox(height: 16),

            // Servidor
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.computer, size: 30), SizedBox(width: 12), Text('Servidor')],
            ),
            const SizedBox(height: 32),

            // Barra de progresso
            const LinearProgressIndicator(
              value: 0.45,
              minHeight: 20,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('45%', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),

            // Info
            const Text('Arquivos: 23 de 50'),
            const Text('Tempo estimado: 00:34s'),
            const SizedBox(height: 24),

            // Aguardando
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('⏳', style: TextStyle(fontSize: 24)),
                SizedBox(width: 8),
                Text('Por favor, aguarde...', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, HandlerState state, AppConfig config) {

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: _buildFormArea(state, context, config),
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
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(title: Text('Sucesso'), content: Text('Treino Sincronizado')),
      );

      _userTrainingSessionStorage.clear(_contractToken);
      Navigator.of(context).pop();
    }
  }

  Widget _buildFormSyncBuilder(
    BuildContext context,
    HandlerState state,
    AppConfig config,
    AsyncSnapshot<UserTrainingSessionModel?> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('Nenhum dado encontrado.'));
    } else {
      // Now... we have data and we can call method
      _userTrainingSessionInstance = snapshot.data!;
      if (!_syncStarted) {
        _syncStarted = true;
        _userTrainingSessionInstance.syncStatus = 'SUCCESS';
        context.read<SyncPageCubit>().sync(_userTrainingSessionInstance);
      }

      return _buildForm(context, state, config);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SyncPageCubit(_repository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sincronizar'),
          actions: [
            if (config.isDebugMode) ProWidgetInfoAlertDialog(title: 'page', text: 'sync_page.dart'),
          ],
        ),
        body: BlocConsumer<SyncPageCubit, HandlerState>(
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
          builder: (context, state) => FutureBuilder<UserTrainingSessionModel?>(
            future: _userTrainingSessionModelFuture,
            builder: (context, snapshot) => _buildFormSyncBuilder(context, state, config, snapshot),
          ),
        ),
      ),
    );
  }
}

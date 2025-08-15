import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';
import 'package:treinadorpro/core/provider/training_pack_provider.dart';
import 'package:treinadorpro/core/utils/global.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/domain/entities/training_pack.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/utils/alert.dart';
import '../../../../core/widgets/pro_widget_heading_name.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_info_row.dart';
import '../../../../core/widgets/pro_widget_section_title.dart';
import '../blocs/change_status_training_package_cubit.dart';

class TrainingPackagePageDetail extends ConsumerStatefulWidget {
  final TrainingPack packTrainingEntity;

  const TrainingPackagePageDetail({super.key, required this.packTrainingEntity});

  @override
  ConsumerState<TrainingPackagePageDetail> createState() => _TrainingPackagePageDetailState();
}

class _TrainingPackagePageDetailState extends ConsumerState<TrainingPackagePageDetail> {
  late final ITrainingPackRepository _trainingPackRepository;
  late final AppConfig config;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // load providers
    config = ref.read(appConfigProvider);
    _trainingPackRepository = ref.read(trainingPackRepositoryProvider);
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProWidgetHeadingName(name: widget.packTrainingEntity.description),
            SizedBox(height: 4),
            Divider(height: 32),

            ProWidgetSectionTitle(title: 'Detalhes'),
            ProWidgetInfoRow(
              label: 'Modalidade',
              value: widget.packTrainingEntity.modality!.namePt,
            ),
            ProWidgetInfoRow(
              label: 'Duração',
              value: '${widget.packTrainingEntity.durationDays} dias',
            ),
            ProWidgetInfoRow(
              label: 'Frequência',
              value: '${widget.packTrainingEntity.weeklyFrequency}x/semana',
            ),
            ProWidgetInfoRow(
              label: 'Valor',
              value: '${widget.packTrainingEntity.currency!} ${widget.packTrainingEntity.price}',
            ),
            ProWidgetInfoRow(label: 'Notas', value: widget.packTrainingEntity.notes),
            ProWidgetInfoRow(
              label: 'Status',
              value: '...',
              widget: getStatus(widget.packTrainingEntity.status),
            ),

            // edit and delete action buttons
            if (!['D', 'I'].contains(widget.packTrainingEntity.status))
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Editar'),
                    style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                  ),

                  // delete action button
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      showAlertDialog(
                        context,
                        'TEM CERTEZA DE MOVER O PACOTE DE TREINO PARA LIXEIRA?',
                        () {
                          context.read<ChangeStatusTrainingPackageCubit>().changeStatus(
                            widget.packTrainingEntity.externalId,
                            'D',
                          );
                          Navigator.of(context).pop();
                        },
                        () => Navigator.of(context).pop(),
                      );
                    },
                    icon: Icon(Icons.delete),
                    label: Text('MOVER PARA LIXEIRA'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: Size.fromHeight(50),
                    ),
                  ),
                ],
              ),

            // delete permanently action button
            if (['D', 'I'].contains(widget.packTrainingEntity.status))
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<ChangeStatusTrainingPackageCubit>().changeStatus(
                        widget.packTrainingEntity.externalId,
                        'K',
                      );
                    },
                    icon: Icon(Icons.delete_forever),
                    label: Text('EXCLUIR PERMANENTEMENTE'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: Size.fromHeight(50),
                    ),
                  ),

                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      showAlertDialog(
                        context,
                        'TEM CERTEZA DE REATIVAR PACOTE QUE FOI ENVIADO PARA LIXEIRA?',
                            () {
                          context.read<ChangeStatusTrainingPackageCubit>().changeStatus(
                            widget.packTrainingEntity.externalId,
                            'R',
                          );
                          Navigator.of(context).pop();
                        },
                            () => Navigator.of(context).pop(),
                      );
                    },
                    icon: Icon(Icons.restore_from_trash),
                    label: Text('REATIVAR PACOTE'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size.fromHeight(50),
                    ),
                  ),
                ],
              ),

            // close action button
            SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
              label: Text('Fechar'),
              style: OutlinedButton.styleFrom(minimumSize: Size.fromHeight(50)),
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
      showAlertCloseDialog(context, 'Operação realizada com sucesso', () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangeStatusTrainingPackageCubit(_trainingPackRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pacote de Treino'),
          actions: [
            if (config.isDebugMode)
              ProWidgetInfoAlertDialog(title: "Page", text: "training_package_page_detail.dart"),
          ],
        ),
        body: BlocConsumer<ChangeStatusTrainingPackageCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:treinadorpro/core/widgets/pro_widget_action_buttons_page_detail.dart';

import '../../../../core/domain/entities/pack_training.dart';
import '../../../../core/widgets/pro_widget_heading_name.dart';
import '../../../../core/widgets/pro_widget_info_row.dart';
import '../../../../core/widgets/pro_widget_section_title.dart';

class TrainingPackagePageDetail extends StatelessWidget {

  final PackTrainingEntity packTrainingEntity;

  const TrainingPackagePageDetail({super.key, required this.packTrainingEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacote de Treino'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProWidgetHeadingName(name: packTrainingEntity.description),
            SizedBox(height: 4),
            Divider(height: 32),

            ProWidgetSectionTitle(title: 'Detalhes'),
            ProWidgetInfoRow(label: 'Modalidade', value: packTrainingEntity.modality!.namePt),
            ProWidgetInfoRow(label: 'Duração', value: '${packTrainingEntity.durationDays} dias'),
            ProWidgetInfoRow(label: 'Frequência', value: '${packTrainingEntity.weeklyFrequency}x/semana'),
            ProWidgetInfoRow(label: 'Valor', value: '${packTrainingEntity.currency!} ${packTrainingEntity.price}'),
            ProWidgetInfoRow(label: 'Notas', value: packTrainingEntity.notes),

            // Action buttons for page detail
            ProWidgetActionButtonsPageDetail(
                textEdit: 'Editar',
                onPressedEdit: (){},
                textDelete: 'Excluir',
                onPressedDelete: (){},
                textBack: 'Fechar',
            ),
          ],
        ),
      ),
    );
  }
}

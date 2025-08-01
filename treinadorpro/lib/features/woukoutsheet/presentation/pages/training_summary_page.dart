import 'package:flutter/material.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/pro_widget_alert_dialog.dart';

class TrainingSummaryPage extends StatelessWidget {
  const TrainingSummaryPage({super.key});

  void _showAlertDialogSyncPage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProWidgetAlertDialog(
        title: 'O treino foi encerrado. Quer enviar agora para ficha do aluno?',
        proceedButton: 'Sim, salve a ficha',
        onProceed: () {
          Navigator.of(context).pop();

          Navigator.popAndPushNamed(context, AppRoutes.syncPage);
        },
        onCancel: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('A ficha será enviada antes do próximo treino')));
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text("RESUMO DO TREINO"),
          ],
        ),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text("Aluno: João da Silva"),
            const Text("Data: 31/07/2025 às 15:22"),
            const SizedBox(height: 12),
            const Row(
              children: [
                Icon(Icons.check_circle_outline, color: Colors.teal),
                SizedBox(width: 8),
                Text("DURAÇÃO: CONCLUÍDO"),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.fitness_center),
                SizedBox(width: 8),
                Text("Exercícios realizados: 8"),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [Icon(Icons.access_time), SizedBox(width: 8), Text("Séries totais: 24")],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.fitness_center_outlined),
                SizedBox(width: 8),
                Expanded(child: Text("Grupos musculares: Peito, Tríceps, Ombro")),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.stacked_bar_chart),
                SizedBox(width: 8),
                Text("Carga média: 42,5 kg"),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [Icon(Icons.repeat), SizedBox(width: 8), Text("Repetições médias: 10")],
            ),
            const SizedBox(height: 24),
            const Text("Observações:"),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Digite suas observações...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showAlertDialogSyncPage(context),
                icon: Icon(Icons.sync),
                label: Text('SALVAR E SINCRONIZAR'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

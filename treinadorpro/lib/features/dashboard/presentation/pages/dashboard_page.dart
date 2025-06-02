import 'package:flutter/material.dart';
import 'package:treinadorpro/features/dashboard/presentation/widgets/status_dashboard_item.dart';
import 'package:treinadorpro/features/dashboard/presentation/widgets/free_available_time.dart';

import '../../../overduestudent/presentation/pages/payments_overdue_page.dart';

class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppName'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Bom dia, Julio! 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('📅 Hoje: Sexta-feira, 31 de Maio'),
            SizedBox(height: 16),
            StatusDashboardItem(
              icon: Icons.fitness_center,
              title: 'Treinos de hoje',
              trailing: '3 alunos',
            ),
            StatusDashboardItem(
              icon: Icons.attach_money,
              title: 'Pagamentos em atraso',
              trailing: '2 alunos',
              color: Colors.redAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaymentsOverduePage()),
                );
              },
            ),
            StatusDashboardItem(
              icon: Icons.access_time,
              title: 'Último treino de João',
              trailing: '7 dias atrás',
            ),
            StatusDashboardItem(
              icon: Icons.group,
              title: 'Alunos ativos',
              trailing: '18',
            ),
            StatusDashboardItem(
              icon: Icons.bar_chart,
              title: 'Faturamento Maio',
              trailing: 'R\$ 4.200,00',
            ),
            SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('Novo Treino'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person_add),
                  label: Text('Novo Aluno'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.payment),
                  label: Text('Registrar Pagamento'),
                ),
              ],
            ),
            FreeAvailableTime(),

          ],
        ),
      ),
    );
  }
}

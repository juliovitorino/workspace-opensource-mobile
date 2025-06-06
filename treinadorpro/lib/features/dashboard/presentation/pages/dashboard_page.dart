import 'package:flutter/material.dart';
import 'package:treinadorpro/core/domain/entities/user_entity.dart';
import 'package:treinadorpro/features/activestudents/presentation/pages/active_students_page.dart';
import 'package:treinadorpro/features/dashboard/presentation/widgets/status_dashboard_item.dart';
import 'package:treinadorpro/features/dashboard/presentation/widgets/free_available_time.dart';
import 'package:treinadorpro/features/newstudent/presentation/pages/new_student_page.dart';
import 'package:treinadorpro/features/notifications/presentation/pages/notifications_page.dart';
import 'package:treinadorpro/features/paymenthistory/presentation/pages/payment_history_page.dart';
import 'package:treinadorpro/features/todayworkout/presentation/pages/today_workouts_page.dart';
import 'package:treinadorpro/features/trainerprofile/presentation/pages/trainer_profile_page_detail.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/training_packages_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/build_workout_sheet_page.dart';

import '../../../../core/infrastructure/storage/user_entity_local_storage_service_impl.dart';
import '../../../overduestudent/presentation/pages/payments_overdue_page.dart';

class DashboardPage extends StatelessWidget {

  final _userEntityLocalStorage = UserEntityLocalStorageServiceImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppName'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TrainerProfilePageDetail()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            FutureBuilder(future: _userEntityLocalStorage.getById(99999), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Carregando...');
              } else if (snapshot.hasData && snapshot.data != null) {
                return Text('Bem-vindo, ${snapshot.data!.name} 👋',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),);
              } else {
                return const Text('Usuário não encontrado');
              }
            }),
            SizedBox(height: 8),
            Text('📅 Hoje: Sexta-feira, 31 de Maio'),
            SizedBox(height: 16),
            StatusDashboardItem(
              icon: Icons.fitness_center,
              title: 'Treinos de hoje',
              trailing: '3 alunos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TodayWorkoutsPage()),
                );
              },
            ),
            StatusDashboardItem(
              icon: Icons.edit_note,
              title: 'Pacotes de Treino',
              trailing: '3 opções',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TrainingPackagesPage()),
                );
              },
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
              icon: Icons.group,
              title: 'Alunos ativos',
              trailing: '18',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ActiveStudentsPage()),
                );
              },
            ),
            StatusDashboardItem(
              icon: Icons.bar_chart,
              title: 'Faturamento Maio',
              trailing: 'R\$ 4.200,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaymentHistoryPage()),
                );
              },
            ),
            SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NewStudentPage()),
                    );
                  },
                  icon: Icon(Icons.person_add),
                  label: Text('Novo Aluno'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BuildWorkoutSheetPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.fitness_center),
                  label: Text('Montar Treino'),
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

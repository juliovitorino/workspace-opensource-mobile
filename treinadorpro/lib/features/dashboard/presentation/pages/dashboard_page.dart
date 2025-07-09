import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/trainer_user_storage_service.dart';
import 'package:treinadorpro/core/provider/user_provider.dart';
import 'package:treinadorpro/features/activestudents/presentation/pages/active_contracts_page.dart';
import 'package:treinadorpro/features/activestudents/presentation/pages/active_students_page.dart';
import 'package:treinadorpro/features/dashboard/presentation/widgets/pro_widget_free_available_time.dart';
import 'package:treinadorpro/features/dashboard/presentation/widgets/pro_widget_status_dashboard_item.dart';
import 'package:treinadorpro/features/newstudent/presentation/pages/new_student_page.dart';
import 'package:treinadorpro/features/notifications/presentation/pages/notifications_page.dart';
import 'package:treinadorpro/features/paymenthistory/presentation/pages/payment_history_page.dart';
import 'package:treinadorpro/features/todayworkout/presentation/pages/today_workouts_page.dart';
import 'package:treinadorpro/features/trainerprofile/presentation/pages/trainer_profile_page_detail.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/pages/training_packages_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/build_workout_sheet_page.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/token_storage_service.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../overduestudent/presentation/pages/payments_overdue_page.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {

  String token = "";
  final StorageService<String> _tokenStorage = TokenStorageService();
  final StorageService<UserModel> _trainerStorage = TrainerUserStorageService();

  Future<String?> getToken() => _tokenStorage.get();

  @override
  void initState() {
    Future.microtask(() async {
      token = (await getToken())!;
      ref.read(userViewModelProvider.notifier).getLoggedUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userState = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('AppName'),
        actions: [
          ProWidgetInfoAlertDialog(
            title: 'token',
            text: token,
            icon: Icons.lock,
          ),
          ProWidgetInfoAlertDialog(
            title: 'page',
            text: 'dashboard_page.dart',
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TrainerProfilePageDetail(token)),
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
            _userState.when(
                data: (user) {
                  _trainerStorage.save(user);
                  return Text('Bem-vindo, ${user.name} 👋',
                      style: kWelcomeUserMessageTextStyle);
                },
                error: (e,_) => Center(child: Text("Erro: $e"),),
                loading: () => Center(child: CircularProgressIndicator(),)
            ),

            SizedBox(height: 8),
            Text('📅 Hoje: Sexta-feira, 31 de Maio'),
            SizedBox(height: 16),

            // today workout
            ProWidgetStatusDashboardItem(
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

            // training packs
            ProWidgetStatusDashboardItem(
              icon: Icons.edit_note,
              title: 'Pacotes de Treino',
              trailing: '3 opções',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TrainingPackagePage()),
                );
              },
            ),

            // overdue payments
            ProWidgetStatusDashboardItem(
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

            // active students
            ProWidgetStatusDashboardItem(
              icon: Icons.group,
              title: 'Alunos ativos',
              trailing: '18',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ActiveContractsPage()),
                );
              },
            ),

            // revenue monthly
            ProWidgetStatusDashboardItem(
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

            //action buttons
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

            // available free time
            ProWidgetFreeAvailableTime(),
          ],
        ),
      ),
    );
  }
}



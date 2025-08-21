import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/trainer_user_storage_service.dart';
import 'package:treinadorpro/core/provider/dashboard_provider.dart';
import 'package:treinadorpro/core/provider/user_provider.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/utils/string_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_custom_loading_indicator.dart';
import 'package:treinadorpro/features/activestudents/presentation/pages/active_contracts_page.dart';
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
      ref
          .read(findTrainerAvailableTimeViewModelProvider.notifier)
          .findTrainerAvailableTime();
      ref.read(dashboardStatusViewModelProvider.notifier).dashboardStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userState = ref.watch(userViewModelProvider);
    final _trainerAvailableTimeState = ref.watch(
      findTrainerAvailableTimeViewModelProvider,
    );
    final _dashboardState = ref.watch(dashboardStatusViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('AppName'),
        actions: [
          ProWidgetInfoAlertDialog(
            title: 'token',
            text: token,
            icon: Icons.lock,
          ),
          ProWidgetInfoAlertDialog(title: 'page', text: 'dashboard_page.dart'),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TrainerProfilePageDetail(token),
                ),
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
                return Text(
                  'Bem-vindo, ${getFirstString(user.name)} 👋',
                  style: kWelcomeUserMessageTextStyle,
                );
              },
              error: (e, _) => Center(child: Text("Erro: $e")),
              loading: () => Center(child: CircularProgressIndicator()),
            ),

            SizedBox(height: 8),
            Text('📅 Hoje: ${getFormattedDate('pt_BR')}'),
            SizedBox(height: 16),

            // today workout
            _dashboardState.when(
              data: (data) => ProWidgetStatusDashboardItem(
                icon: Icons.fitness_center,
                title: 'Treinos de hoje',
                trailing: '${data.objectResponse.totalTodayWorkout} alunos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TodayWorkoutPage()),
                  );
                },
              ),
              error: (e, _) => Center(child: Text('error: $e')),
              loading: () => ProWidgetStatusDashboardItem(
                icon: Icons.fitness_center,
                title: 'Treinos de hoje',
                trailing: '...',
                onTap: () {},
              ),
            ),

            //training packs
            _dashboardState.when(
              data: (data) => ProWidgetStatusDashboardItem(
                icon: Icons.edit_note,
                title: 'Pacotes de Treino',
                trailing: '${data.objectResponse.totalTrainingPack} opções',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TrainingPackagePage()),
                  );
                },
              ),
              error: (e, _) => Center(child: Text('error: $e')),
              loading: () => ProWidgetStatusDashboardItem(
                icon: Icons.edit_note,
                title: 'Pacotes de Treino',
                trailing: '...',
                onTap: () {},
              ),
            ),

            // overdue payments
            _dashboardState.when(
              data: (data) => ProWidgetStatusDashboardItem(
                icon: Icons.attach_money,
                title: 'Pagamentos em atraso',
                trailing: 'BRL ${data.objectResponse.overdueAmountContracts}',
                color: Colors.redAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentsOverduePage()),
                  );
                },
              ),
              error: (e, _) => Center(child: Text('error: $e')),
              loading: () =>  ProWidgetStatusDashboardItem(
                icon: Icons.attach_money,
                title: 'Pagamentos em atraso',
                trailing: '...',
                onTap: () {},
              ),
            ),

            // active students
            _dashboardState.when(
              data: (data) => ProWidgetStatusDashboardItem(
                icon: Icons.group,
                title: 'Alunos ativos',
                trailing: '${data.objectResponse.activeStudentContract}',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ActiveContractsPage()),
                  );
                },
              ),
              error: (e, _) => Text('error: $e'),
              loading: () => ProWidgetStatusDashboardItem(
                icon: Icons.group,
                title: 'Alunos ativos',
                trailing: '...',
                onTap: () {},
              ),
            ),

            // revenue monthly
            _dashboardState.when(
              data: (data) =>
                  ProWidgetStatusDashboardItem(
                    icon: Icons.bar_chart,
                    title: 'Faturamento Neste Mês',
                    trailing: 'BRL ${data.objectResponse.totalAmountReceivedMonth}',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PaymentHistoryPage()),
                      );
                    },
                  ),
              error: (e,_) => Text('error: $e'),
              loading: () =>  ProWidgetStatusDashboardItem(
                icon: Icons.bar_chart,
                title: 'Faturamento Neste Mês',
                trailing: '...',
                onTap: () {},
              ),
            ),

            // account statement
            ProWidgetStatusDashboardItem(
              icon: Icons.monetization_on,
              title: 'Extrato',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaymentHistoryPage()),
                );
              }, trailing: '...',
            )   ,

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
              ],
            ),

            // available free time
            _trainerAvailableTimeState.when(
              data: (data) => ProWidgetFreeAvailableTime(data.objectResponse),
              error: (e, _) => Center(child: Text('Error: $e')),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

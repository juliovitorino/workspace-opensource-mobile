import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/student_payment_response_model.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_empty_state.dart';
import 'package:treinadorpro/features/registerpayment/presentation/pages/register_payment_page.dart';

import '../../../../core/infrastructure/localstorage/bill_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';

class PaymentsOverduePage extends ConsumerStatefulWidget {
  const PaymentsOverduePage({super.key});

  @override
  ConsumerState<PaymentsOverduePage> createState() => _PaymentsOverduePageState();
}

class _PaymentsOverduePageState extends ConsumerState<PaymentsOverduePage> {
  late AppConfig config;
  final StorageService<StudentPaymentResponseModel> _billStorage = BillStorageService();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    Future.microtask(() async {
      ref
          .read(findAllStudentOverduePaymentViewModelProvider.notifier)
          .findAllStudentOverduePayment();
    });
  }

  int _getDaysLate(DateTime dueDate) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dueDate);
    return difference.inDays;
  }

  Widget _buildCard(StudentPaymentResponseModel overduePayment) {
    double _earlyPayments = 0.00;
    overduePayment.studentPaymentsTransactions?.forEach((e) => _earlyPayments += e.receivedAmount!);
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
                  overduePayment.contract.studentUser.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'BRL \$ ${(overduePayment.amount - _earlyPayments).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(overduePayment.contract.description),
            SizedBox(height: 4),
            Text(
              'Vencimento: ${getDateTimeToDate(overduePayment.dueDate)}  | ${_getDaysLate(overduePayment.dueDate)} dias de atraso',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 12),
            Wrap(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.chat),
                  label: Text('WhatsApp'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                SizedBox(width: 8, height: 40),
                OutlinedButton.icon(
                  onPressed: () async {
                    await _billStorage.save(overduePayment);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RegisterPaymentPage()),
                    ).then(
                      (onValue) => setState(() async {
                        await ref
                            .read(findAllStudentOverduePaymentViewModelProvider.notifier)
                            .findAllStudentOverduePayment();
                        print('1');
                      }),
                    );
                  },
                  icon: Icon(Icons.check_circle_outline),
                  label: Text('Registrar Pagamento'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(List<StudentPaymentResponseModel> data) {
    double total = data.fold(0.0, (sum, item) => sum + item.amount);

    return Column(
      children: [
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total sem receber:', style: TextStyle(fontSize: 16)),
              Text(
                'BRL \$ ${total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent[700],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _buildCard(data[index]);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _studentPaymentState = ref.watch(findAllStudentOverduePaymentViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamentos em Atraso'),
        actions: [
          if (config.isDebugMode)
            ProWidgetInfoAlertDialog(title: 'page', text: 'payments_overdue_page.dart'),
        ],
      ),
      body: _studentPaymentState.when(
        data: (data) {
          final List<StudentPaymentResponseModel> studentPaymentList = data.objectResponse;
          return studentPaymentList.isEmpty
              ? ProWidgetEmptyState()
              : _buildListView(data.objectResponse);
        },
        error: (e, _) => Center(child: Text('error: $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

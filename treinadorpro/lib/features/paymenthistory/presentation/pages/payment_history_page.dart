import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/student_payment_response_model.dart';
import '../../../../core/data/models/student_payments_transaction_response_model.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../registerpayment/presentation/pages/register_payment_page.dart';

class PaymentHistoryPage extends ConsumerStatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  ConsumerState<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends ConsumerState<PaymentHistoryPage> {

  late AppConfig config;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    Future.microtask(() async {
      ref
          .read(findAllStudentReceivedPaymentViewModelProvider.notifier)
          .findAllStudentOverduePayment();
    });
  }

  Widget _buildCard(StudentPaymentsTransactionResponseModel payment) {
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
                  payment.studentPayment!.contract.studentUser.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'BRL \$ ${payment.receivedAmount?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text('${payment.studentPayment!.contract.description} | ${payment.studentPayment!.contract.trainingPack.description}'),
            SizedBox(height: 4),
            Text(
              'Vencimento: ${getDateTimeToDate(payment.studentPayment!.dueDate)} ',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 4),
            Text(
              'Pago em: ${getDateTimeToDate(payment.paymentDate!)} ',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 4),
            Text(
              'Forma de Pagamento: ${payment.paymentMethod!} ',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 12),
            Wrap(
              children: [
                SizedBox(width: 8, height: 40),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.check_circle_outline),
                  label: Text('Enviar Recibo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(List<StudentPaymentsTransactionResponseModel> data) {
    double total = data.fold(0.0, (sum, item) => sum + item.receivedAmount!);

    return Column(
      children: [
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total recebido:', style: TextStyle(fontSize: 16)),
              Text(
                'BRL \$ ${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[700]),
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

    final _studentPaymentState = ref.watch(findAllStudentReceivedPaymentViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamentos Recebidos'),
        actions: [
          if(config.isDebugMode)
            ProWidgetInfoAlertDialog(
              title: 'page',
              text: 'payments_history_page.dart',
            ),
        ],
      ),
      body: _studentPaymentState.when(
        data: (data) => _buildListView(data.objectResponse),
        error: (e, _) => Center(child: Text('error: $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}


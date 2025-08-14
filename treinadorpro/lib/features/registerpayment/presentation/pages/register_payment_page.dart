import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/requests/receive_student_payment_request_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/bill_storage_service.dart';
import 'package:treinadorpro/core/utils/alert.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_alert_close_dialog.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';
import 'package:treinadorpro/features/registerpayment/presentation/blocs/register_payment_cubit.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/student_payment_response_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';

class RegisterPaymentPage extends ConsumerStatefulWidget {
  final String studentName = 'João Silva';
  final String plan = 'Plano Mensal';
  final String dueDate = '10/05/2025';
  final double expectedAmount = 150.00;

  @override
  ConsumerState<RegisterPaymentPage> createState() => _RegisterPaymentPageState();
}

class _RegisterPaymentPageState extends ConsumerState<RegisterPaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _paymentMethod = 'PIX';
  final StorageService<StudentPaymentResponseModel> _billStorage = BillStorageService();

  late final IContractRespository _contractRespository;
  late final AppConfig config;

  late StudentPaymentResponseModel? billInstance;

  @override
  void initState() {
    super.initState();
    _dateController.text = DateTime.now().toString().split(' ')[0];
    _amountController.text = widget.expectedAmount.toStringAsFixed(2);

    // load providers
    config = ref.read(appConfigProvider);
    _contractRespository = ref.read(contractRepositoryProvider);
  }

  Widget _buildWidgetForm(BuildContext context, StudentPaymentResponseModel? bill) {
    double _earlyValues = 0.00;
    bill!.studentPaymentsTransactions?.forEach((e) => _earlyValues += e.receivedAmount ?? 0.00);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProWidgetSectionTitle(title: bill!.contract.studentUser.name),
        ProWidgetInfoRow(label: 'Pacote', value: bill.contract.trainingPack.description),
        ProWidgetInfoRow(label: 'Vencimento', value: getDateTimeToDate(bill.dueDate)),
        ProWidgetInfoRow(label: 'Valor Contratado', value: bill.amount.toStringAsFixed(2)),
        ProWidgetInfoRow(label: 'Valores Pagos', value: _earlyValues.toStringAsFixed(2)),
        ProWidgetInfoRow(
          label: 'Valor Devido',
          value: (bill.amount - _earlyValues).toStringAsFixed(2),
        ),

        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 16),

        Text('Data do Pagamento'),
        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(prefixIcon: Icon(Icons.date_range), hintText: 'AAAA-MM-DD'),
          keyboardType: TextInputType.datetime,
        ),
        SizedBox(height: 16),

        Text('Valor Recebido'),
        TextFormField(
          controller: _amountController,
          decoration: InputDecoration(prefixIcon: Icon(Icons.attach_money)),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(height: 16),

        Text('Forma de Pagamento'),
        DropdownButtonFormField<String>(
          value: _paymentMethod,
          items: [
            'PIX',
            'Cartão',
            'Dinheiro',
            'Transferência',
            'Boleto',
          ].map((method) => DropdownMenuItem(child: Text(method), value: method)).toList(),
          onChanged: (value) {
            setState(() => _paymentMethod = value!);
          },
        ),
        SizedBox(height: 16),

        Text('Observações'),
        TextFormField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Ex: pagamento parcial, desconto, etc.',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBillBuilder(
    BuildContext context,
    AsyncSnapshot<StudentPaymentResponseModel?> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('Nenhum dado encontrado.'));
    } else {
      // Now... we have data and we can call method
      billInstance = snapshot.data;
      return _buildWidgetForm(context, billInstance);
    }
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // bill data
            FutureBuilder<StudentPaymentResponseModel?>(
              future: _billStorage.get(),
              builder: (context, snapshot) => _buildBillBuilder(context, snapshot),
            ),

            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<RegisterPaymentCubit>().registerPayment(
                    billInstance!.externalId,
                    ReceiveStudentPaymentRequestModel(
                      paymentDate: DateTime.parse(_dateController.text),
                      receivedAmount: double.parse(_amountController.text),
                      paymentMethod: _paymentMethod,
                    ),
                  );
                }
              },
              icon: Icon(Icons.check_circle),
              label: Text('Confirmar Pagamento'),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.receipt),
              label: Text('Enviar Recibo'),
              style: OutlinedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            SizedBox(height: 8),
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
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
      showAlertCloseDialog(context, 'Registro realizado com sucesso', () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });

      // Navigator.popAndPushNamed(context, AppRoutes.workoutSheetDetailPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterPaymentCubit(_contractRespository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrar Pagamento'),
          actions: [ProWidgetInfoAlertDialog(title: 'page', text: 'register_payment_page.dart')],
        ),
        body: BlocConsumer<RegisterPaymentCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}

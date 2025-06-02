import 'package:flutter/material.dart';

class RegisterPaymentPage extends StatefulWidget {
  final String studentName = 'João Silva';
  final String plan = 'Plano Mensal';
  final String dueDate = '10/05/2025';
  final double expectedAmount = 150.00;

  @override
  State<RegisterPaymentPage> createState() => _RegisterPaymentPageState();
}

class _RegisterPaymentPageState extends State<RegisterPaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _paymentMethod = 'PIX';

  @override
  void initState() {
    super.initState();
    _dateController.text = DateTime.now().toString().split(' ')[0];
    _amountController.text = widget.expectedAmount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Pagamento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(widget.studentName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${widget.plan} • Vencimento: ${widget.dueDate}'),
              SizedBox(height: 16),

              Text('Data do Pagamento'),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  hintText: 'AAAA-MM-DD',
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 16),

              Text('Valor Recebido'),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16),

              Text('Forma de Pagamento'),
              DropdownButtonFormField<String>(
                value: _paymentMethod,
                items: ['PIX', 'Cartão', 'Dinheiro', 'Transferência', 'Boleto']
                    .map((method) => DropdownMenuItem(
                  child: Text(method),
                  value: method,
                ))
                    .toList(),
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

              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // salvar dados aqui
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
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  final List<PaymentEntry> payments = [
    PaymentEntry(
      studentName: 'João Pedro',
      date: '05/05/2025',
      value: 150.00,
      method: 'PIX',
      plan: 'Mensal',
      period: '01/05 a 31/05',
    ),
    PaymentEntry(
      studentName: 'Carla Lima',
      date: '08/05/2025',
      value: 390.00,
      method: 'Cartão',
      plan: 'Trimestral',
      period: '01/05 a 31/07',
    ),
    PaymentEntry(
      studentName: 'Rodrigo Silva',
      date: '12/05/2025',
      value: 120.00,
      method: 'Dinheiro',
      plan: 'Online',
      period: '01/05 a 31/05',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double total = payments.fold(0, (sum, item) => sum + item.value);

    return Scaffold(
      appBar: AppBar(title: Text('Faturamento Maio')),
      body: Column(
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
                  'R\$ ${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[700]),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final payment = payments[index];
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
                              payment.studentName,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'R\$ ${payment.value.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text('${payment.plan} (${payment.period})'),
                        Text('Forma de pagamento: ${payment.method}'),
                        Text('Data: ${payment.date}'),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.receipt),
                            label: Text('Enviar Recibo'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentEntry {
  final String studentName;
  final String date;
  final double value;
  final String method;
  final String plan;
  final String period;

  PaymentEntry({
    required this.studentName,
    required this.date,
    required this.value,
    required this.method,
    required this.plan,
    required this.period,
  });
}

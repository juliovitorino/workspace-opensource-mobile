import 'package:flutter/material.dart';
import 'package:treinadorpro/features/registerpayment/presentation/pages/register_payment_page.dart';

class PaymentsOverduePage extends StatelessWidget {
  final List<OverdueStudent> overdueStudents = [
    OverdueStudent(
      name: 'João Silva',
      plan: 'Plano Mensal',
      dueDate: '10/05/2025',
      daysLate: 21,
      amount: 150.00,
    ),
    OverdueStudent(
      name: 'Carla Souza',
      plan: 'Plano Trimestral',
      dueDate: '05/05/2025',
      daysLate: 26,
      amount: 390.00,
    ),
    OverdueStudent(
      name: 'Lucas Andrade',
      plan: 'Plano Online',
      dueDate: '20/04/2025',
      daysLate: 41,
      amount: 120.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagamentos em Atraso')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: overdueStudents.length,
        itemBuilder: (context, index) {
          final student = overdueStudents[index];
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
                        student.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${student.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(student.plan),
                  SizedBox(height: 4),
                  Text(
                    'Vencimento: ${student.dueDate}  |  ${student.daysLate} dias de atraso',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.chat),
                        label: Text('WhatsApp'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                      SizedBox(width: 8, height: 40),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RegisterPaymentPage(),
                            ),
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
        },
      ),
    );
  }
}

class OverdueStudent {
  final String name;
  final String plan;
  final String dueDate;
  final int daysLate;
  final double amount;

  OverdueStudent({
    required this.name,
    required this.plan,
    required this.dueDate,
    required this.daysLate,
    required this.amount,
  });
}

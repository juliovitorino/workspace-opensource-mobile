import 'package:flutter/material.dart';

import '../../../registerpayment/presentation/pages/register_payment_page.dart';

class ActiveStudentsPage extends StatelessWidget {
  final List<ActiveStudent> students = [
    ActiveStudent(
      name: 'João Pedro',
      plan: 'Plano Trimestral',
      nextWorkout: '03/06/2025 às 10:00',
      expiration: '15/07/2025',
      frequency: '3x/semana',
    ),
    ActiveStudent(
      name: 'Carla Lima',
      plan: 'Plano Mensal',
      nextWorkout: '04/06/2025 às 08:00',
      expiration: '10/06/2025',
      frequency: '2x/semana',
    ),
    ActiveStudent(
      name: 'Rodrigo Silva',
      plan: 'Plano Online',
      nextWorkout: 'Hoje às 19:00',
      expiration: '01/08/2025',
      frequency: '4x/semana',
    ),
    ActiveStudent(
      name: 'Anderson Silva',
      plan: 'Plano Online',
      nextWorkout: 'Hoje às 19:00',
      expiration: '01/08/2025',
      frequency: '4x/semana',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alunos Ativos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
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
                      Icon(Icons.fitness_center, color: Colors.blueAccent),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(student.plan),
                  SizedBox(height: 4),
                  Text('Próximo treino: ${student.nextWorkout}'),
                  Text('Vencimento: ${student.expiration}'),
                  Text('Frequência: ${student.frequency}'),
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
                        onPressed: () {},
                        icon: Icon(Icons.person),
                        label: Text('Ver Perfil'),
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

class ActiveStudent {
  final String name;
  final String plan;
  final String nextWorkout;
  final String expiration;
  final String frequency;

  ActiveStudent({
    required this.name,
    required this.plan,
    required this.nextWorkout,
    required this.expiration,
    required this.frequency,
  });
}

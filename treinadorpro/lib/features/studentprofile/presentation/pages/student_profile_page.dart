import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  final String studentName = 'João Pedro';
  final String gender = 'Masculino';
  final String dob = '15/03/1995';
  final String phone = '(11) 99999-1234';
  final String email = 'joao.pedro@email.com';

  final String plan = 'Plano Trimestral';
  final String startDate = '15/04/2025';
  final String endDate = '15/07/2025';
  final String frequency = '3x/semana';
  final String objective = 'Hipertrofia';

  final List<String> lastPayments = [
    '05/05/2025 - R\$ 150,00 - PIX',
    '15/04/2025 - R\$ 150,00 - Cartão',
    '15/03/2025 - R\$ 150,00 - Dinheiro',
  ];

  final String lastWorkout = '30/05/2025';
  final String nextWorkout = '03/06/2025 às 10:00';

  final Map<String, String> bodyMetrics = {
    'Peso Atual': '76.4 kg',
    'Altura': '1.78 m',
    'Bíceps Direito': '35 cm',
    'Bíceps Esquerdo': '34.5 cm',
    'Cintura': '82 cm',
    'Peitoral': '98 cm',
    'Quadril': '94 cm',
    'Coxa Direita': '58 cm',
    'Coxa Esquerda': '57.5 cm',
    'Panturrilha Direita': '38 cm',
    'Panturrilha Esquerda': '37.8 cm'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil do Aluno')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Text(studentName[0], style: TextStyle(fontSize: 32)),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: Text(studentName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 16),

            _sectionTitle('Informações Pessoais'),
            _infoRow('Sexo', gender),
            _infoRow('Nascimento', dob),
            _infoRow('Telefone', phone),
            _infoRow('Email', email),

            SizedBox(height: 16),
            _sectionTitle('Plano Atual'),
            _infoRow('Plano', plan),
            _infoRow('Início', startDate),
            _infoRow('Vencimento', endDate),
            _infoRow('Frequência', frequency),

            SizedBox(height: 16),
            _sectionTitle('Objetivo e Treinos'),
            _infoRow('Objetivo', objective),
            _infoRow('Último Treino', lastWorkout),
            _infoRow('Próximo Treino', nextWorkout),

            SizedBox(height: 16),
            _sectionTitle('Avaliação Física'),
            ...bodyMetrics.entries.map((entry) => _infoRow(entry.key, entry.value)),

            SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.history),
              label: Text('Ver Histórico'),
            ),

            SizedBox(height: 16),
            _sectionTitle('Pagamentos Recentes'),
            ...lastPayments.map((p) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text('• $p'),
            )),

            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.assignment),
                  label: Text('Treino Atual'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_chart),
                  label: Text('Avaliação Física'),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.payment),
                  label: Text('Pagamento'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                  label: Text('Agendar Treino'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );

  Widget _infoRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label + ':', style: TextStyle(fontWeight: FontWeight.w500)),
        Text(value),
      ],
    ),
  );
}

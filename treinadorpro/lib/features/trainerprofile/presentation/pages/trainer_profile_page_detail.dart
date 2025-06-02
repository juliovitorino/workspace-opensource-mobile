import 'package:flutter/material.dart';

class TrainerProfilePageDetail extends StatelessWidget {
  final String name = 'Jorge Mendes';
  final String cref = 'CREF 123456-G/RJ';
  final String phone = '(21) 98765-4321';
  final String email = 'jorge.pt@email.com';
  final String birthDate = '12/06/1988';
  final String experience = '8 anos';

  final List<String> specialties = [
    'Musculação',
    'Funcional',
    'Online',
    'Alongamento'
  ];

  final String location = 'Academia PowerFit - Copacabana/RJ';
  final int activeStudents = 22;
  final int sessionsThisMonth = 96;
  final String revenue = 'R\$ 6.480,00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // lógica para editar perfil
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              child: Text(name[0], style: TextStyle(fontSize: 32)),
            ),
            SizedBox(height: 12),
            Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(cref, style: TextStyle(color: Colors.grey[700])),
            Divider(height: 32),

            _sectionTitle('Contato'),
            _infoRow('Telefone', phone),
            _infoRow('E-mail', email),
            _infoRow('Nascimento', birthDate),

            SizedBox(height: 16),
            _sectionTitle('Atuação'),
            _infoRow('Local', location),
            _infoRow('Especialidades', specialties.join(', ')),
            _infoRow('Experiência', experience),

            SizedBox(height: 16),
            _sectionTitle('Indicadores'),
            _infoRow('Alunos ativos', activeStudents.toString()),
            _infoRow('Treinos no mês', sessionsThisMonth.toString()),
            _infoRow('Faturamento', revenue),

            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.lock),
              label: Text('Alterar Senha'),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout),
              label: Text('Sair'),
              style: OutlinedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    ),
  );

  Widget _infoRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label + ':', style: TextStyle(fontWeight: FontWeight.w500)),
        Flexible(child: Text(value, textAlign: TextAlign.right)),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/provider/user_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_circle_avatar.dart';
import 'package:treinadorpro/core/widgets/pro_widget_heading_name.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';

import '../../../../core/domain/entities/user.dart';

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
      body: Consumer(
          builder: (context, ref, _){
            
            // execute only once after first frame
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(userViewModelProvider.notifier).findUserByUUID('39c0fd19-dbd2-4c74-8104-7105ca159c7b');
            });

            final userState = ref.watch(userViewModelProvider);

            return userState.when(
                data: (user) => _buildTrainerProfileContent(user),
                error: (e, _) => Center(child: Text('Erro: $e')),
                loading: () => const Center(child: CircularProgressIndicator())
            );

          })
    );
  }

  Widget _buildTrainerProfileContent(UserModel user) =>
      SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProWidgetCircleAvatar(name: user.name),
            SizedBox(height: 12),
            ProWidgetHeadingName(name: user.name),
            SizedBox(height: 4),
            Text(cref, style: TextStyle(color: Colors.grey[700])),
            Divider(height: 32),

            ProWidgetSectionTitle(title: 'Contato'),
            ProWidgetInfoRow(label: 'Telefone', value: phone),
            ProWidgetInfoRow(label: 'E-mail', value: email),
            ProWidgetInfoRow(label: 'Nascimento', value: birthDate),

            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Atuação'),
            ProWidgetInfoRow(label: 'Local', value: location),
            ProWidgetInfoRow(label: 'Especialidades', value: specialties.join(', ')),
            ProWidgetInfoRow(label: 'Experiência', value: experience),

            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Indicadores'),
            ProWidgetInfoRow(label: 'Alunos ativos', value: activeStudents.toString()),
            ProWidgetInfoRow(label: 'Treinos no mês', value: sessionsThisMonth.toString()),
            ProWidgetInfoRow(label: 'Faturamento', value: revenue),

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
      );
}

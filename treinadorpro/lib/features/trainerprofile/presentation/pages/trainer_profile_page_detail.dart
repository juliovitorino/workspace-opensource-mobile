import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/provider/user_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_circle_avatar.dart';
import 'package:treinadorpro/core/widgets/pro_widget_heading_name.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';

class TrainerProfilePageDetail extends ConsumerStatefulWidget {
  const TrainerProfilePageDetail({super.key});

  @override
  ConsumerState<TrainerProfilePageDetail> createState() => _TrainerProfilePageDetailState();

}

class _TrainerProfilePageDetailState extends ConsumerState<TrainerProfilePageDetail> {
  final int activeStudents = 22;
  final int sessionsThisMonth = 96;
  final String revenue = 'R\$ 6.480,00';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
        ref.read(userViewModelProvider.notifier).findUserByUUID('39c0fd19-dbd2-4c74-8104-7105ca159c7b');
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // lógica para editar perfil
            },
          )
        ],
      ),
      body: userState.when(
        data: (user) => _buildTrainerProfileContent(user),
        error: (e, _) => Center(child: Text('Erro: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
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
            Text(user.personalFeature!.register!, style: TextStyle(color: Colors.grey[700])),
            Divider(height: 32),

            ProWidgetSectionTitle(title: 'Contato'),
            ProWidgetInfoRow(label: 'Telefone', value: user.cellphone!),
            ProWidgetInfoRow(label: 'E-mail', value: user.email!),
            ProWidgetInfoRow(label: 'Nascimento', value: user.birthday.toString()),

            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Atuação'),
            ProWidgetInfoRow(label: 'Local', value: user.personalFeature!.place!),
            ProWidgetInfoRow(label: 'Especialidades', value: user.personalFeature!.specialty!),
            ProWidgetInfoRow(label: 'Experiência', value: user.personalFeature!.experience!),

            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Plano'),
            ProWidgetInfoRow(label: 'Descrição', value: 'FREEMIUM'),
            ProWidgetInfoRow(label: 'Valor', value: 'BRL 67,00'),
            ProWidgetInfoRow(label: 'Desconto', value: 'BRL 67,00'),
            ProWidgetInfoRow(label: 'Frequência', value: 'Mensal'),
            ProWidgetInfoRow(label: 'Vencimento', value: '2025-10-30'),
            ProWidgetInfoRow(label: 'Qtde pacotes permitidos', value: '5'),
            ProWidgetInfoRow(label: 'Qtde alunos permitidos', value: '15'),
            ProWidgetInfoRow(label: 'Situação', value: 'PENDENTE'),

            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Indicadores'),
            ProWidgetInfoRow(label: 'Alunos ativos', value: activeStudents.toString()),
            ProWidgetInfoRow(label: 'Treinos no mês', value: sessionsThisMonth.toString()),
            ProWidgetInfoRow(label: 'Faturamento', value: revenue),

            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Outros'),
            ProWidgetInfoRow(label: 'Situação', value: user.status),
            ProWidgetInfoRow(label: 'Registro Criado em', value: user.createdAt.toString()),
            ProWidgetInfoRow(label: 'Última Atualização', value: user.updatedAt.toString()),
            ProWidgetInfoRow(label: 'Último login', value: user.lastLogin.toString()),

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

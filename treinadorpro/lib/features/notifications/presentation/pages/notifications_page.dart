import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      icon: Icons.fitness_center,
      title: 'Treino hoje às 18:00 com João',
      subtitle: 'Toque para abrir a ficha de treino.',
      onTap: () {},
    ),
    NotificationItem(
      icon: Icons.warning,
      title: 'Pagamento vencido: Carla',
      subtitle: '3 dias de atraso. Registrar agora?',
      onTap: () {},
    ),
    NotificationItem(
      icon: Icons.calendar_today,
      title: 'Avaliação física de Lucas amanhã',
      subtitle: 'Lembre-se de levar a fita métrica.',
      onTap: () {},
    ),
    NotificationItem(
      icon: Icons.message,
      title: 'Marina pediu para mudar o horário',
      subtitle: 'Toque para responder.',
      onTap: () {},
    ),
    NotificationItem(
      icon: Icons.access_time,
      title: 'Rafael ausente há 10 dias',
      subtitle: 'Considere enviar uma mensagem.',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            child: ListTile(
              leading: Icon(item.icon, color: Colors.blue),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              trailing: Icon(Icons.chevron_right),
              onTap: item.onTap,
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

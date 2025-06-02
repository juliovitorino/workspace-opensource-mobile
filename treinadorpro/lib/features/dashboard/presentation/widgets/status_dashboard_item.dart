import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/constants.dart';

class StatusDashboardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;
  final Color? color;

  const StatusDashboardItem({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Text(trailing, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

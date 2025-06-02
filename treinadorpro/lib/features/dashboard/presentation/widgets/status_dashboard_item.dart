import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/styles.dart';

class StatusDashboardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;
  final Color? color;
  final VoidCallback? onTap;

  const StatusDashboardItem({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    this.color = kPrimaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(title, style: TextStyle(color: Colors.white)),
          trailing: Text(trailing, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

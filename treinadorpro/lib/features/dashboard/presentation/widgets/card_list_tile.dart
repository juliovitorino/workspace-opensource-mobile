import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/constants.dart';

class CardListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String trailing;

  const CardListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: ListTile(
        leading: Icon(icon, color: Colors.white,),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Text(trailing, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProWidgetEmptyState extends StatelessWidget {
  final IconData? icon;
  final String? message;

  const ProWidgetEmptyState({
    Key? key,
    this.icon,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.info_outline,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            message ?? "Nenhum dado foi encontrado",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
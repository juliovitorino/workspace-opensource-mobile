import 'package:flutter/material.dart';

class ProWidgetStatus extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;

  const ProWidgetStatus({
    super.key,
    required this.text,
    this.backgroundColor = Colors.green,
    this.borderColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor!, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

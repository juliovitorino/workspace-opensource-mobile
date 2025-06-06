import 'package:flutter/material.dart';

class ProWidgetInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProWidgetInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label:', style: TextStyle(fontWeight: FontWeight.w500)),
        Flexible(child: Text(value, textAlign: TextAlign.right)),
      ],
    ),
  );
}

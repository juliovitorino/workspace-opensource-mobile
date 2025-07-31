import 'package:flutter/material.dart';

class ProWidgetInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? widget;

  const ProWidgetInfoRow({super.key, required this.label, required this.value, this.widget});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label:', style: TextStyle(fontWeight: FontWeight.w500)),
        widget ?? Flexible(child: Text(value, textAlign: TextAlign.right)),
      ],
    ),
  );
}

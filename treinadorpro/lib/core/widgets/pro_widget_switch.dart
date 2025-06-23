import 'package:flutter/material.dart';

class ProWidgetSwitch extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool)? onChanged;

  const ProWidgetSwitch({
    super.key,
    required this.text,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(text)),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}

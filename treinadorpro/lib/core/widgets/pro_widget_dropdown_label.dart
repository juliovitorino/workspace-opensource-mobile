import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/iname.dart';

class ProWidgetDropdownLabel<T extends IName> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> items;
  final Function(T?)? onChanged;

  const ProWidgetDropdownLabel({
    super.key,
    required this.value,
    required this.items,
    this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(width: 100),
        Expanded(
          // fit: FlexFit.loose,
          child: DropdownButtonFormField<T>(
            value: value,
            items: items
                .map(
                  (g) => DropdownMenuItem(value: g, child: Text(g.getName())),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

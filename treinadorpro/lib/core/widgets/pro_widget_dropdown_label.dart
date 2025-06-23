import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/iname.dart';

class ProWidgetDropdownLabel<T extends IName> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> items;
  final Function(T?)? onChanged;

  const ProWidgetDropdownLabel({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // Largura fixa para alinhar com os outros labels
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: DropdownButtonFormField<T>(
              value: value,
              items: items
                  .map(
                    (g) => DropdownMenuItem(
                  value: g,
                  child: Text(g.getName()),
                ),
              )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

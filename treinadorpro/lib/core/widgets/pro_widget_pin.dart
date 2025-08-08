import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProWidgetPin extends StatelessWidget {
  final String pinMessage;

  const ProWidgetPin({super.key, required this.pinMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('📌 $pinMessage'),
    );
  }
}

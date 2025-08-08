import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProWidgetWarningMessage extends StatelessWidget {
  final String pinMessage;
  final String actionButtonLabel;
  final Function()? onWarningPressed;
  final Widget? actionButtonIcon;

  const ProWidgetWarningMessage({
    super.key,
    required this.pinMessage,
    this.onWarningPressed,
    required this.actionButtonLabel,
    this.actionButtonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.red[100],
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🚨 $pinMessage'),
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: onWarningPressed,
            icon: actionButtonIcon,
            label: Text(actionButtonLabel),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProWidgetAlertCloseDialog extends StatelessWidget {
  final VoidCallback? onClose;
  final String title;

  const ProWidgetAlertCloseDialog({
    super.key,
    required this.title,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 48,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                onPressed: onClose,
                child: Text('Fechar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

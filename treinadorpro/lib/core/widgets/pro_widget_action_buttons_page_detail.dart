import 'package:flutter/material.dart';

class ProWidgetActionButtonsPageDetail extends StatelessWidget {
  final String? textEdit;
  final String? textDelete;
  final String? textBack;
  final VoidCallback? onPressedEdit;
  final VoidCallback? onPressedDelete;

  const ProWidgetActionButtonsPageDetail({
    super.key,
    this.onPressedEdit,
    this.onPressedDelete,
    this.textEdit = 'Edit',
    this.textDelete = 'Delete', this.textBack = 'Back',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: onPressedEdit,
          icon: Icon(Icons.edit),
          label: Text(textEdit!),
          style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
        ),
        SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: onPressedDelete,
          icon: Icon(Icons.delete),
          label: Text(textDelete!),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            minimumSize: Size.fromHeight(50),
          ),
        ),
        SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.logout),
          label: Text(textBack!),
          style: OutlinedButton.styleFrom(minimumSize: Size.fromHeight(50)),
        ),
      ],
    );
  }
}

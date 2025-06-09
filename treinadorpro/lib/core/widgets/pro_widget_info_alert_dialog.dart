import 'package:flutter/material.dart';

class ProWidgetInfoAlertDialog extends StatelessWidget {
  final String title;
  final String text;

  const ProWidgetInfoAlertDialog({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: [
                TextButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop(); // fecha o dialog
                  },
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.info),
    );
  }
}

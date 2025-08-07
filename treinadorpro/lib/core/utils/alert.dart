
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/pro_widget_alert_close_dialog.dart';
import '../widgets/pro_widget_alert_dialog.dart';

void showAlertCloseDialog(BuildContext context, String title, Function()? onClose) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => ProWidgetAlertCloseDialog(title: title, onClose: onClose ?? () => Navigator.of(context).pop() ),
  );
}

void showAlertDialog(BuildContext context, String title, Function()? onProceed, Function()? onCancel) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => ProWidgetAlertDialog(
      title: title,
      proceedButton: 'Concordo',
      onProceed: onProceed ?? () => Navigator.of(context).pop(),
      onCancel: onCancel ?? () => Navigator.of(context).pop(),
    ),
  );
}
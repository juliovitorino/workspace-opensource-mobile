import 'package:flutter/material.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/widgets/pro_widget_text_field_container.dart';


class ProWidgetRoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Color color;
  final TextEditingController? controller;
  const ProWidgetRoundedPasswordField({super.key, required this.onChanged, this.color = kPrimaryLightColor, this.controller});

  @override
  Widget build(BuildContext context) {
    return ProWidgetTextFieldContainer(
      color: color,
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

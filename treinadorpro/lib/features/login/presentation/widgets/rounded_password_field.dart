import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/text_field_container.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Color color;
  const RoundedPasswordField({super.key, required this.onChanged, this.color = kPrimaryLightColor});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      child: TextField(
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

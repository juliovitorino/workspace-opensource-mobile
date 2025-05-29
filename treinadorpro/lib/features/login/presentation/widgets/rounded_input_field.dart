import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color;
  final ValueChanged<String> onChanged;
  const RoundedInputField({super.key,  required this.hintText,  this.icon = Icons.person, required this.onChanged, this.color = kPrimaryLightColor});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          icon: Icon(icon, color: kPrimaryColor),
        ),
      ),
    );
  }
}
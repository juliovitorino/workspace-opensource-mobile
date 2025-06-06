import 'package:flutter/material.dart';

import '../constants/styles.dart';

class ProWidgetCircleAvatar extends StatelessWidget {

  final String name;
  final double? radius;

  const ProWidgetCircleAvatar({super.key, required this.name, this.radius = 45});

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius,
    child: Text(name[0], style: kCircleAvatarTextStyle),
  );
}

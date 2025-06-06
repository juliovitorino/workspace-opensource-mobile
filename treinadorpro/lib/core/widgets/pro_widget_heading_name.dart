import 'package:flutter/material.dart';

import '../constants/styles.dart';

class ProWidgetHeadingName extends StatelessWidget {
  
  final String name;
  const ProWidgetHeadingName({super.key, required this.name});

  @override
  Widget build(BuildContext context) => Text(name, style: kHeadingName);
}

import 'package:flutter/material.dart';

import '../constants/styles.dart';

class ProWidgetSectionTitle extends StatelessWidget {
  final String title;

  const ProWidgetSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: kSectionTitleTextStyle,
      ),
    ),
  );
}

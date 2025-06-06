import 'package:flutter/material.dart';

class ProWidgetBrandImage extends StatelessWidget {

  final String imagePath;
  final double? height;
  final double? width;

  const ProWidgetBrandImage({super.key, required this.imagePath, this.height=128, this.width=128});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}

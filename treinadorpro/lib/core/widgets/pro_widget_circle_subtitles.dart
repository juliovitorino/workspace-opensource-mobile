import 'package:flutter/cupertino.dart';

class ProWidgetCircleSubtitles extends StatelessWidget {
  final Color cor;
  final String texto;

  const ProWidgetCircleSubtitles({
    required this.cor,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          texto,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
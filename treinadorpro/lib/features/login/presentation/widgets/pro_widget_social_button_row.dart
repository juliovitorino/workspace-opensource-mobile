import 'package:flutter/material.dart';
import 'package:treinadorpro/features/login/presentation/widgets/pro_widget_social_button_item.dart';

class ProWidgetSocialButtonRow extends StatelessWidget {
  const ProWidgetSocialButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProWidgetSocialButtonItem(
            onTap: () => print('Login with Apple tapped'),
            logo: AssetImage('assets/logos/apple.png'),
          ),
          ProWidgetSocialButtonItem(
            onTap: () => print('Login with Google tapped'),
            logo: AssetImage('assets/logos/google.png'),
          ),
        ],
      ),
    );
  }
}

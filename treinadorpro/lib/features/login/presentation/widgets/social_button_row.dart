import 'package:flutter/material.dart';
import 'package:treinadorpro/features/login/presentation/widgets/social_button_item.dart';

class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SocialButtonItem(
            onTap: () => print('Login with Apple tapped'),
            logo: AssetImage('assets/logos/apple.png'),
          ),
          SocialButtonItem(
            onTap: () => print('Login with Google tapped'),
            logo: AssetImage('assets/logos/google.png'),
          ),
        ],
      ),
    );
  }
}

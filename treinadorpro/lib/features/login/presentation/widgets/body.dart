import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/constants.dart';
import 'package:treinadorpro/core/widgets/rounded_button.dart';
import 'package:treinadorpro/core/widgets/text_field_container.dart';
import 'package:treinadorpro/features/login/presentation/widgets/rounded_input_field.dart';
import 'package:treinadorpro/features/login/presentation/widgets/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LOGIN"),
          SizedBox(height: size.height * 0.03),
          Image.asset("assets/images/exercises.png", height: size.height * 0.4),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(hintText: "Your Email", onChanged: (value) {}),
          RoundedPasswordField(onChanged: (value){}),
          RoundedButton(text: "LOGIN", onPressed: (){}, color: kPrimaryColor,),
        ],
      ),
    );
  }
}

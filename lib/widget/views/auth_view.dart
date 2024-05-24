import 'package:flutter/material.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/custom_logo.dart';
import 'package:notes2/widget/register_button.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/title.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomLogo(),
              title(context: context),
              const SizedBox(height: 80),
              const LogInButton(),
              const SizedBox(height: 20),
              const RegistretButton(title: 'Register Now'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

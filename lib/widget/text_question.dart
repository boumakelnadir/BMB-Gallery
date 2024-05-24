import 'package:flutter/material.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/views/auth_view.dart';

class TextQuestion extends StatelessWidget {
  const TextQuestion({
    super.key,
    required this.questionText,
    required this.answerText,
  });
  final String questionText;
  final String answerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              FadeRoute(const AuthView()),
              (route) => false,
            );
          },
          child: Text(
            answerText,
            style: const TextStyle(
              color: colorLogo,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

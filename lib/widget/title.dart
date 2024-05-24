import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes2/widget/const/const.dart';

Widget title({required BuildContext context}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: 'B',
        style: GoogleFonts.dancingScript(
          textStyle: Theme.of(context).textTheme.displaySmall,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        children: const [
          TextSpan(
            text: ' M',
            style: TextStyle(
              color: colorLogo,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: ' B Gallery',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ]),
  );
}

import 'package:flutter/material.dart';
import 'package:notes2/widget/const/const.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.5,
      margin: const EdgeInsets.only(top: 40, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 2, color: colorLogo),
      ),
      child: const CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      // borderRadius: BorderRadius.circular(65),
      // border: Border.all(
      //   color: Colors.white,
      //   width: 2,
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/views/register_view.dart';

class RegistretButton extends StatelessWidget {
  const RegistretButton(
      {super.key, required this.title, this.width, this.onTap});
  final String title;
  final bool? width;
  final Widget? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap == null) {
          Navigator.push(context, FadeRoute(const RegisterView()));
        } else {
          Navigator.push(context, FadeRoute(onTap!));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: width == null
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: colorLogo,
              width: 2,
            )),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: colorLogo,
          ),
        ),
      ),
    );
  }
}

class RegistretButton2 extends StatelessWidget {
  const RegistretButton2(
      {super.key, required this.title, this.width, this.onTap});
  final String title;
  final bool? width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, top: 15),
        width: width == null
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: colorLogo,
              width: 2,
            )),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: colorLogo,
          ),
        ),
      ),
    );
  }
}

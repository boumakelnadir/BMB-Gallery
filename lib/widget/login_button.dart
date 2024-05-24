import 'package:flutter/material.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/views/login_view.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, FadeRoute(const LogInView()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: colorLogo.withAlpha(200),
              offset: const Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
          color: Colors.white,
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            color: colorLogo,
          ),
        ),
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute(this.page)
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: page,
                ));
}

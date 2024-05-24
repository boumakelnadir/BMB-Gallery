// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes2/controller/user_controller.dart';
import 'package:notes2/firebase/signIn_account.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/custom_logo.dart';
import 'package:notes2/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes2/widget/custom_title.dart';
import 'package:notes2/widget/helper/awesome_dialog.dart';

import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/register_button.dart';
import 'package:notes2/widget/text_question.dart';
import 'package:notes2/widget/views/home_view.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const route = 'loginView';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool circleIndicator = false;
  @override
  void dispose() {
    GlobalKey;
    TextEditingController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: circleIndicator
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.grey.withOpacity(0.5),
              color: colorLogo,
            ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              color: backgroundColor,
              child: Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomLogo(),
                      CustomTitle(
                        title: 'Log in',
                        size: 25,
                        color: Colors.white,
                        subTitle: 'Enter Your Personal Information',
                        colorSubTitle: Colors.grey[300],
                      ),
                      CustomTextFormField(
                        prefixIcon: Icons.email,
                        hint: 'Email',
                        controller: email,
                        keyboard: TextInputType.emailAddress,
                      ),
                      CustomTextFormField(
                        obscure: true,
                        showObscure: true,
                        prefixIcon: Icons.lock,
                        hint: 'password',
                        controller: password,
                        keyboard: TextInputType.visiblePassword,
                      ),
                      RegistretButton2(
                        title: 'Log in',
                        width: true,
                        onTap: () async {
                          if (_key.currentState!.validate()) {
                            setState(() {
                              circleIndicator = true;
                            });
                            await singInAcount(
                              context,
                              email: email.text,
                              password: password.text,
                            );
                            if (FirebaseAuth.instance.currentUser != null &&
                                FirebaseAuth
                                    .instance.currentUser!.emailVerified) {
                              return Navigator.pushAndRemoveUntil(
                                context,
                                FadeRoute(const HomeView()),
                                (route) => false,
                              );
                            } else {
                              setState(() {
                                circleIndicator = false;
                              });
                              return awesomeDialog(
                                context: context,
                                title: 'Verify Your email',
                                desc: 'required verify your email First',
                                dialogType: DialogType.error,
                              );
                            }
                          }
                        },
                      ),
                      const TextQuestion(
                        questionText: 'Dont Have an Account ',
                        answerText: ' Register',
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: colorLogo),
                      const GoogleSignIn(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({
    super.key,
  });

  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool circleIndicator = false;
  @override
  void initState() {
    circleIndicator = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return circleIndicator
        ? const Center(
            child: CircularProgressIndicator(
              color: colorLogo,
            ),
          )
        : TextButton(
            onPressed: () async {
              try {
                setState(() {
                  circleIndicator = true;
                });
                final user = await UserConteroller.signInWithGoogle();
                if (user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                    FadeRoute(HomeView()),
                    (route) => false,
                  );
                }
                setState(() {
                  circleIndicator = false;
                });
              } on FirebaseAuthException catch (e) {
                log(e.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      e.message ?? 'something weng wrog',
                    ),
                  ),
                );
              } catch (e) {
                log(e.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      e.toString(),
                    ),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2, color: colorLogo)),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Google',
                  style: TextStyle(
                    color: colorLogo,
                    fontSize: 25,
                    fontFamily: GoogleFonts.merriweather().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }
}

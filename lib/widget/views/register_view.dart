// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:notes2/firebase/create_account.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/custom_logo.dart';
import 'package:notes2/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes2/widget/custom_title.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/register_button.dart';
import 'package:notes2/widget/text_question.dart';
import 'package:notes2/widget/views/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const route = 'registerView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController fullName = TextEditingController();
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
  void initState() {
    circleIndicator;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: circleIndicator
          ? const Center(child: CircularProgressIndicator())
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
                        title: 'Register',
                        size: 25,
                        color: Colors.white,
                        subTitle: 'Enter Your Personal Information',
                        colorSubTitle: Colors.grey[300],
                      ),
                      CustomTextFormField(
                        controller: fullName,
                        prefixIcon: Icons.person,
                        hint: 'Full Name',
                        keyboard: TextInputType.name,
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
                        title: 'Register',
                        width: true,
                        onTap: () async {
                          if (_key.currentState!.validate()) {
                            setState(() {
                              circleIndicator = true;
                            });
                            await createAcount(
                              context,
                              email: email.text,
                              password: password.text,
                            );
                            setState(() {
                              circleIndicator = false;
                            });
                            FirebaseAuth.instance.currentUser!
                                .sendEmailVerification();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Send Verify in Your email'),
                              ),
                            );

                            Navigator.push(
                              context,
                              FadeRoute(const LogInView()),
                            );
                          }
                        },
                      ),
                      const TextQuestion(
                        questionText: 'have an account ',
                        answerText: 'Log in',
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

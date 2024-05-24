import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes2/widget/views/auth_view.dart';
import 'package:notes2/widget/views/home_view.dart';
import 'package:notes2/widget/views/login_view.dart';
import 'package:notes2/widget/views/register_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BMBGallery());
}

class BMBGallery extends StatefulWidget {
  const BMBGallery({super.key});

  @override
  State<BMBGallery> createState() => _BMBGalleryState();
}

class _BMBGalleryState extends State<BMBGallery> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'BMB Gallery',
      routes: {
        LogInView.route: (context) => const LogInView(),
        RegisterView.route: (context) => const RegisterView(),
      },
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const HomeView()
          : const AuthView(),
    );
  }
}

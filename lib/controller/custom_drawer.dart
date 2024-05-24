import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes2/widget/const/const.dart';
import 'package:notes2/widget/login_button.dart';
import 'package:notes2/widget/views/auth_view.dart';

final drawerHeader = UserAccountsDrawerHeader(
  decoration: BoxDecoration(color: colorLogo.withOpacity(0.8)),
  accountName: const Text('Boumakel Nadir'),
  accountEmail: const Text('Boumakel1998@gmail.com'),
  currentAccountPicture: const CircleAvatar(
    backgroundImage: NetworkImage("https://source.unsplash.com/random?sig="),
  ),
  // ignore: prefer_const_literals_to_create_immutables
  otherAccountsPictures: [
    const CircleAvatar(
      backgroundColor: Colors.blueAccent,
      child: Text('N'),
    ),
    const CircleAvatar(
      backgroundColor: Colors.redAccent,
      child: Text('F'),
    ),
  ],
);

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.drawerHeader,
  });

  final UserAccountsDrawerHeader drawerHeader;
  final Color colorText = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.8),
      child: ListView(
        children: [
          drawerHeader,
          ListTile(
            title: Text(
              'Dashboard',
              style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              var signInGoogle = GoogleSignIn();

              if (await signInGoogle.isSignedIn() == true) {
                GoogleSignIn().signOut();
                log('Google SignOut');
              }
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                FadeRoute(const AuthView()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

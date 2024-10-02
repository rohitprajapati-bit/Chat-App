import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/auth/login_or_register.dart';


class AuthGet extends StatelessWidget {
  const AuthGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return const LoginOrRegister() ;
            }
          }),
    );
  }
}

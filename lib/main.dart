import 'package:chat_app/auth/auth_get.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.ubuntuTextTheme().copyWith(
          bodyMedium: GoogleFonts.ubuntu(textStyle: textTheme.bodyMedium),
        ),
        useMaterial3: true,
      ),
      home: AuthGet(),
    );
  }
}

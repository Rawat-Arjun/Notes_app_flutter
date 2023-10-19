import 'package:flutter/material.dart';
import 'package:flutter_app/Assets/images/routes.dart';
import 'package:flutter_app/Pages/intro.dart';
import 'package:flutter_app/Pages/login_page.dart';
import 'package:flutter_app/Pages/note_page.dart';
import 'package:flutter_app/Pages/register_page.dart';
import 'package:flutter_app/Pages/verify_email.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const RegisterPage(),
      routes: {
        ScreenRoutes.login:(context) => const LoginPage(),
        ScreenRoutes.register:(context) => const RegisterPage(),
        ScreenRoutes.verifyEmail:(context) => const VerifyEmailPage(),
        ScreenRoutes.note:(context) => const NotePage(),
        ScreenRoutes.intro:(context) => const IntroPage(),
      },
    );
  }
}
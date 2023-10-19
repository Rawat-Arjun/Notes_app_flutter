import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/home_page.dart';
import 'package:flutter_app/firebase_options.dart' show DefaultFirebaseOptions;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const HomePage());
}

import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth ;
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    final bheight = MediaQuery.sizeOf(context).height;
    final bwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: ' We sent an',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' Email Verification',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' on your email address .',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                height: bheight * 0.08,
                width: bwidth * 0.60,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Re-send Email',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.currentUser?.sendEmailVerification();
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

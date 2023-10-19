import 'package:flutter/material.dart';
import 'package:flutter_app/Assets/images/routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bheight = MediaQuery.sizeOf(context).height;
    var bwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.note_alt_outlined,
            size: 350,
          ),
          const Text(
            'Welcome to Notes App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: bheight * 0.06,
                  width: bwidth * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Login Page',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, ScreenRoutes.login);
                },
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: bheight * 0.06,
                  width: bwidth * 0.38,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Register Page',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, ScreenRoutes.register);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

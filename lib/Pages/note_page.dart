import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/dialogBoxes/logout_dialog.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Page'),
        actions: [
          IconButton(onPressed: () {
            showLogOutDialog(context);
          }, icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Note page',
          textScaleFactor: 4,
        ),
      ),
    );
  }
}

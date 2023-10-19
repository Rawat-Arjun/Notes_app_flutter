import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_app/Assets/images/routes.dart';
import 'package:flutter_app/Utils/dialogBoxes/Exceptions/auth_exception.dart';
import 'package:flutter_app/Utils/dialogBoxes/show_error_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bheight = MediaQuery.sizeOf(context).height;
    var bwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage(
                      'lib/Assets/images/login.jpg',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          enableSuggestions: false,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            prefixIcon: const Icon(
                              Icons.account_circle,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email';
                            }
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              return 'Enter Valid Email';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _password,
                          enableSuggestions: false,
                          obscureText: true,
                          autofillHints: const [AutofillHints.password],
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.vpn_key_sharp,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '* Enter Password';
                            }
                            if (value.length<6) {
                              return '* Enter valid Passsword';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: bheight * 0.07,
                      width: bwidth * 0.50,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onTap: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          final email = _email.text;
                          final password = _password.text;
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email, password: password);
                              Navigator.pushNamed(context, ScreenRoutes.note);
                        }
                      } on UserNotFoundAuthException {
                        showErrorDialog(context, 'User not found');
                      } on WrongPasswordAuthException {
                        showErrorDialog(context, 'Wrong password');
                      } on GenericAuthException {
                        showErrorDialog(context, 'Failed to Login !');
                      }
                     
                    },
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.black26,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: bheight * 0.07,
                      width: bwidth * 0.60,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Don\'t have an Account',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

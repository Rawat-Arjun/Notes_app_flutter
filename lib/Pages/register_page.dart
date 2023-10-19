import 'package:cloud_firestore/cloud_firestore.dart'show FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_app/Assets/images/routes.dart';
import 'package:flutter_app/Utils/dialogBoxes/Exceptions/auth_exception.dart';
import 'package:flutter_app/Utils/dialogBoxes/show_error_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bheight = MediaQuery.sizeOf(context).height;
    final bwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page')),
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
                  foregroundImage: AssetImage('lib/Assets/images/register.jpg'),
                  
                    
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          enableSuggestions: false,
                          keyboardType: TextInputType.emailAddress,
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
                        const SizedBox(height: 25),
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
                              'Register',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          onTap: () async{
                            try {
                              final email = _email.text;
                              final password = _password.text;
                              if (_formKey.currentState!.validate()) { 
                                
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: email, password: password);
                            await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                            await FirebaseFirestore.instance.collection('users').doc().set({
                               'email': _email.text,
                            }); 
                            Navigator.pushNamed(context, ScreenRoutes.verifyEmail);
                            }
                            } on EmailAlreadyInUseAuthException{
                              showErrorDialog(context, 'Email already in use');
                            } on GenericAuthException{
                              showErrorDialog(context, 'Failed to register !');
                            } 
                                                      
                          },
                        ),
                        const Divider(
                          height: 20,
                          color: Colors.black26,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                              "Already an Account",
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

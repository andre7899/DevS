import 'package:authentication_example/screens/user_screen.dart';
import 'package:authentication_example/utils/firebase_auth.dart';
import 'package:authentication_example/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final focusEmail = FocusNode();
  final focusPassword = FocusNode();
  final focusName = FocusNode();

  bool _isProccessing = false;
  final formKey = GlobalKey<FormState>();

  void unFocus() {
    focusEmail.unfocus();
    focusPassword.unfocus();
    focusName.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resgistro de usuario'),
      ),
      body: GestureDetector(
        onTap: () {
          unFocus();
        },
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              focusNode: focusName,
              decoration: const InputDecoration(hintText: 'Nombre'),
              validator: Validator.validateName,
            ),
            TextFormField(
              controller: _emailController,
              focusNode: focusEmail,
              decoration: const InputDecoration(hintText: 'Correo'),
              validator: Validator.validateEmail,
            ),
            TextFormField(
              controller: _passwordController,
              focusNode: focusPassword,
              decoration: const InputDecoration(hintText: 'Contraseña'),
              validator: Validator.validatePassword,
            ),
            _isProccessing
                ? const CircularProgressIndicator()
                : Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () async {
                            unFocus();
                            setState(() {
                              _isProccessing = true;
                            });

                            User? user = await FireAuth.signUpUsingEmailAndPass(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            setState(() {
                              _isProccessing = false;
                            });
                            if (user != null) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return UserScreeen(
                                    user: user,
                                  );
                                },
                              ));
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.of(context)
                      //           .pushReplacement(MaterialPageRoute(
                      //         builder: (context) {
                      //           return const RegisterScreen();
                      //         },
                      //       ));
                      //     },
                      //     child: const Text(
                      //       'Registrar',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

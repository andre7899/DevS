import 'package:authentication_example/screens/user_screen.dart';
import 'package:authentication_example/utils/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProccessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: FutureBuilder(
          future: _initFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Login ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextField(
                      controller: _emailFieldController,
                      focusNode: _focusEmail,
                      decoration: const InputDecoration(hintText: 'email..'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _passwordFieldController,
                      focusNode: _focusPassword,
                      decoration: const InputDecoration(hintText: 'passowrd..'),
                    ),
                    _isProccessing
                        ? const CircularProgressIndicator()
                        : Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();
                                    setState(() {
                                      _isProccessing = true;
                                    });

                                    User? user =
                                        await FireAuth.signInUsingEmailAndPass(
                                      email: _emailFieldController.text,
                                      password: _passwordFieldController.text,
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
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: ElevatedButton(
                                  onPressed: null,
                                  child: Text(
                                    'Registrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<FirebaseApp> _initFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}

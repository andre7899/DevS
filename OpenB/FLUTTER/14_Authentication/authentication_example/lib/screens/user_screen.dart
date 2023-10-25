import 'package:authentication_example/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreeen extends StatefulWidget {
  const UserScreeen({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<UserScreeen> createState() => _UserScreeenState();
}

class _UserScreeenState extends State<UserScreeen> {
  bool isSendingVerification = false;
  bool isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pagina de Usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${widget.user.displayName}'),
            Text('Email: ${widget.user.email}'),
            Text(
              'Email ${widget.user.emailVerified ? 'verificado' : 'no verificado'}',
              style: TextStyle(
                  color: widget.user.emailVerified ? Colors.green : Colors.red),
            ),
            widget.user.emailVerified
                ? const SizedBox.shrink()
                : isSendingVerification
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isSendingVerification = true;
                          });
                          await widget.user.sendEmailVerification();
                          setState(() {
                            isSendingVerification = false;
                          });
                        },
                        child: const Text('Verificar Email'),
                      ),
            isSigningOut
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isSigningOut = true;
                      });

                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        isSigningOut = false;
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ));
                    },
                    child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}

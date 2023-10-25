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
          ],
        ),
      ),
    );
  }
}

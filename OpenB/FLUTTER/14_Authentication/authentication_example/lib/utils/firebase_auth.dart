import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireAuth {
  static Future<User?> signInUsingEmailAndPass({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('>>>>>>No user with this email');
      } else if (e.code == 'wrong-password') {
        print('>>>>>>>>>>worng password!!!!');
      } else {
        debugPrint(e.code);
        print('ERRRORRRR');
      }
    }
    return user;
  }

  static Future<User?> signUpUsingEmailAndPass({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseException catch (e) {
      // print(e);
      debugPrint(e.code);
    }
    return user;
  }
}

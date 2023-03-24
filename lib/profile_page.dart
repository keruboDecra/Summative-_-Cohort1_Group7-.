import 'package:finmate/service.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService(FirebaseAuth.instance);
  final String user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    User user = _auth.currentUser!;

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${user.email}'),
            Text('Username: ${user.displayName ?? 'N/A'}'),
            Text('Phone Number: ${user.phoneNumber ?? 'N/A'}'),
            ElevatedButton(
              onPressed: () => _auth.signOut(),
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Future<void> signOut() async {
    final auth = FirebaseAuth.instance;
    await auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer <AuthService>(
      builder: (context, authService, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),

          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome ${authService.user?.displayName}'),
                OutlinedButton(
                  child: const Text('Sign out'),
                  onPressed: () => HomePage.signOut(),
                ),
              ],

            )
          ),
        );
      },
    )
    ;

}
}





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:presenca_aluno/routes/router.gr.dart';


import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({Key? key}) : super(key: key);

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
                Text('Bem-vindo aluno ${authService.user?.displayName}'),
                OutlinedButton(
                  child: const Text('Responder chamada'),
                  onPressed: () => context.router.push(ReadPresenceRoute())
                ),
    
                OutlinedButton(
                  child: const Text('Sign out'),
                  onPressed: () => StudentHomePage.signOut(),
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

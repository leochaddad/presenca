
import 'package:flutter/material.dart';

import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer <AuthService>(
      builder: (context, authService, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),

          ),
          body: Center(
            child:  Text(authService.user?.email ?? 'No user'),
          ),
        );
      },
    )
    ;

}
}

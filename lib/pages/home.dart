

import 'package:flutter/material.dart';
import 'package:presenca_aluno/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // logout button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.routeName);
            
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
    
    
    
  }
}
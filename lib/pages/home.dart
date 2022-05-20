import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presenca_aluno/routes/router.gr.dart';

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
              context.router.push(const StudentHistoryRoute());
            },
            child: const Text('Go to history  page'),
          ),
        ],
      ),
    );
  }
}

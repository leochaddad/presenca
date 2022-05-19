import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:presenca_aluno/pages/home.dart';
import 'package:presenca_aluno/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
      initialRoute: '/',
      
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) =>  LoginPage(),
      },
    );
  }
}

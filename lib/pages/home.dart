


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:presenca_aluno/pages/student/student_home.dart';
import 'package:presenca_aluno/pages/teacher/teacher_home.dart';

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
    return StudentHomePage();
  }
}
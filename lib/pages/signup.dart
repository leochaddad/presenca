import 'dart:js';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPage extends StatelessWidget {
  static const routeName = '/login';

  SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  static Future<User?> signIn(
      String email, String password, String name) async {
    final auth = FirebaseAuth.instance;
    User? user;
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = result.user;
      await user!.updateDisplayName(name);
    } catch (e) {
      print(e.toString());
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(labelText: 'Nome'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(3),
                ]),
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Password is required',
                  ),
                  FormBuilderValidators.minLength(6,
                      errorText: 'Password must be at least 6 characters'),
                ]),
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    // clear form
                    signIn(
                        _formKey.currentState!.value['email'] as String,
                        _formKey.currentState!.value['password'] as String,
                        _formKey.currentState!.value['name'] as String);

                    _formKey.currentState!.reset();
                  }
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

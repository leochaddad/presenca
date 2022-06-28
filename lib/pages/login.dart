

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:presenca_aluno/routes/router.gr.dart';
import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  signIn(String email, String password, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    User? user;
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = result.user;
    } catch (e) {
      _formKey.currentState?.invalidateField(
          name: 'password', errorText: "Senha ou usuário incorreto");
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        // if authService.user != null, then we are logged in, so we should go to the home page
        if (authService.user != null) {
          context.router.popUntilRoot(); 
          context.router.replace( const HomeRoute());
        }
        return Scaffold(
          body: Center(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                        signIn(
                            _formKey.currentState!.value['email'] as String,
                            _formKey.currentState!.value['password'] as String,
                            context);
                      }
                    },
                    child: const Text('Login'),
                  ),
                  OutlinedButton(
                      onPressed: (() => context.pushRoute(SignupRoute())),
                      child: const Text('Signup')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

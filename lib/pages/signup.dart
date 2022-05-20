import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPage extends StatelessWidget {

  SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();


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
                  
                  FormBuilderValidators.minLength(6, errorText: 'Password must be at least 6 characters'),
                ]),
              ),
              ElevatedButton(
                onPressed: () {
                _formKey.currentState!.save();
                if(_formKey.currentState!.validate()) {
                  print(_formKey.currentState!.value);
                  // clear form
                  _formKey.currentState!.reset();
                }
                },
                child: const Text('Login'),
      
              ),
            ],
          ),
        ),
      ),
    );
  }
}

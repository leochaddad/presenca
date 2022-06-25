import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:presenca_aluno/routes/router.gr.dart';
import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class NewPresenceListPage extends StatelessWidget {
  NewPresenceListPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  _submit(BuildContext context, authService) async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {

      
      // the document id is the sha256 hash of the class, start_time,  end_time and the user id
      final id = sha256.convert(utf8.encode('${_formKey.currentState!.value['class']}${_formKey.currentState!.value['start_time']}${_formKey.currentState!.value['end_time']}${authService.user!.uid}')).toString();
      final doc = FirebaseFirestore.instance.collection('presence_lists').doc(id);
      final name = '${_formKey.currentState!.value['class']} - ${_formKey.currentState!.value['start_time']} às ${_formKey.currentState!.value['end_time']}';

      if (await doc.get().then((snapshot) => snapshot.exists)) {
        _formKey.currentState?.invalidateFirstField(
           errorText: 'Já existe uma lista de presença com estes dados');
      } else {
        await doc.set({
          'name': name,
          'class': _formKey.currentState!.value['class'],
          'start_time': _formKey.currentState!.value['start_time'],
          'end_time': _formKey.currentState!.value['end_time'],
          'teacher': authService.user!.uid,
        });
        context.router.push(const HomeRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nova chamada'),
          ),
          body: Center(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormBuilderTextField(
                    name: 'class',
                    decoration: const InputDecoration(labelText: 'Matéria'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(3),
                    ]),
                  ),
                  FormBuilderDateTimePicker(
                    name: "start_time",
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(labelText: "Início"),
                    // first date is today
                    firstDate: DateTime.now(),
                    // last date is 30 days after today
                    lastDate: DateTime(DateTime.now().year + 1),
                    // initial date is today
                    initialDate: DateTime.now(),
                  ),
                  FormBuilderDateTimePicker(
                    name: "end_time",
                    decoration: const InputDecoration(labelText: "Término"),
                    // validate, end time must be after start time
                    validator: (value) {
                      if (value == null) return "Campo obrigatório";

                      if (value!.isBefore(
                          _formKey.currentState!.value['start_time'])) {
                        return 'Término deve ser depois do início';
                      }
                      return null;
                    },
                    // first date is today
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                    // initial date is today
                    initialDate: DateTime.now(),
                  ),
                  OutlinedButton(
                    child: const Text('Criar chamada'),
                    onPressed: () => _submit(context, authService),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

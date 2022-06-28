import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:auto_route/auto_route.dart';


class ReadPresencePage extends StatelessWidget {
  const ReadPresencePage({Key? key}) : super(key: key);

    addToPresenceList(String code, BuildContext context) {

    FirebaseFirestore.instance
      .collection('presence_lists')
      .doc(code)
      .get()
      .then((doc) async {
        if (doc.exists) {
          await FirebaseFirestore.instance
            .collection('presence_lists')
            .doc(code)
            .collection('students')
            .add({
              'name': FirebaseAuth.instance.currentUser!.displayName,
              'id': FirebaseAuth.instance.currentUser!.uid,
            });
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text('Sucesso'),
              content: Text('Você foi adicionado à lista de presença'),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.router.pop();
                  },
                )
              ],
            ));
        

        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Código inválido'),
              content: Text('O código informado não existe.'),
              actions: [
                OutlinedButton(
                  child: const Text('Ok'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        }
      });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              addToPresenceList(code, context);
            }
          }),
    );
  }

}
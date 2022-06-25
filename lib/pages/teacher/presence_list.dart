import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';



class PresenceListPage extends StatefulWidget {
  const PresenceListPage({Key? key, required this.presenceList}) : super(key: key);

  final  Map<String, dynamic> presenceList;

  @override
  State<PresenceListPage> createState() => _PresenceListPageState();
}

class _PresenceListPageState extends State<PresenceListPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.presenceList['name']),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('Lista de presença'),
            ),
            ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
        // teacher id is the id of the user logged in
        stream: FirebaseFirestore.instance
            .collection('presence_lists')
            .doc(widget.presenceList['id'])
            .collection('students')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
              );
            },
          );
        },
      ),
            ),
        ],
      ),
      
    );
  }
}




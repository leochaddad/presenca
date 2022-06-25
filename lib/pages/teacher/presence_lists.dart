import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:presenca_aluno/services/auth_service.dart';
import 'package:provider/provider.dart';

class PresenceListsPage extends StatefulWidget {
  const PresenceListsPage({Key? key}) : super(key: key);

  @override
  State<PresenceListsPage> createState() => _PresenceListsPageState();
}

class _PresenceListsPageState extends State<PresenceListsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Listas de presença'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          // teacher id is the id of the user logged in
          stream: FirebaseFirestore.instance
              .collection('presence_lists')
              .where('teacher',
                  isEqualTo: authService.user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final doc = snapshot.data!.docs[index];
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['name'] ?? 'Nome não definido'),
                  onTap: () => print(doc.id),
                );
              },
            );
          },
        ),
      );
    });
  }
}

import 'package:crud_appwork_skrining/models/user.dart';
import 'package:crud_appwork_skrining/services/users_api.dart';
import 'package:flutter/material.dart';

class TambahTeman extends StatelessWidget {
  TambahTeman({Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void createUser(BuildContext context) {
    debugPrint('Add Data pressed');
    debugPrint('Create User');
    var data = User(
      id: 0,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      weight: weightController.text,
    );

    // Panggil API createUser
    UserApi().createUser(data.toMap());

    // Pesan update sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data teman berhasil ditambahkan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Berat Teman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Body Weight (kg)'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            ElevatedButton(
              onPressed: () => createUser(context),
              child: const Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}

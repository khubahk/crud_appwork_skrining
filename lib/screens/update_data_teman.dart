import 'package:flutter/material.dart';

import 'package:crud_appwork_skrining/models/user.dart';
import 'package:crud_appwork_skrining/services/users_api.dart';

class UpdateDataTeman extends StatelessWidget {
  final User dataUser;

  UpdateDataTeman(this.dataUser, {Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void updateUser(BuildContext context) {
    debugPrint('Update Data pressed');
    var data = User(
      id: dataUser.id,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      weight: weightController.text,
    );

    // API untuk update user data
    UserApi().updateUser(dataUser.id.toString(), data.toMap());

    // Pesan update sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data teman berhasil di update.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    firstNameController.text = dataUser.firstName;
    lastNameController.text = dataUser.lastName;
    weightController.text = dataUser.weight;
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
              onPressed: () => updateUser(context),
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}

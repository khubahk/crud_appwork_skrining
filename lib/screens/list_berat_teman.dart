import 'dart:convert';
import 'package:crud_appwork_skrining/screens/update_data_teman.dart';
import 'package:crud_appwork_skrining/screens/tambah_teman.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/list_teman_provider.dart';
import '../services/users_api.dart';

class ListBeratTeman extends StatelessWidget {
  const ListBeratTeman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berat Badan Temanku'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahTeman()),
                );
              },
              icon: const Icon(Icons.group_add_rounded)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ListTemanProvider>(context, listen: false).refreshData();
        },
        child: const Icon(Icons.refresh),
      ),
      body: StreamBuilder<String>(
        stream: Provider.of<ListTemanProvider>(context).userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (snapshot.hasData) {
            final jsonData =
                json.decode(snapshot.data!)['data'] as List<dynamic>;
            List<User> users =
                jsonData.map((userJson) => User.fromMap(userJson)).toList();
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(child: Text((index + 1).toString())),
                  title: Text(
                      '${users[index].firstName} ${users[index].lastName}'),
                  subtitle: Text('Berat Badannya ${users[index].weight} kg'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateDataTeman(users[index])),
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          UserApi().deleteUser(users[index].id.toString());
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            // Jika belum ada data, muncul pesan berikut
            return const Center(child: Text('Belum ada data yang tersedia'));
          }
        },
      ),
    );
  }
}

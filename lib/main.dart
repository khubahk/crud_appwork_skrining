import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/list_teman_provider.dart';
import 'screens/list_berat_teman.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ListTemanProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListBeratTeman(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:rick_and_morty/providers/export.dart';
import 'package:rick_and_morty/screens/export.dart';
import 'package:rick_and_morty/services/export.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KeyValueStorageServices().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CharacterProvider(
                characterService: CharacterServiceImpl(),
                keyValueStorageServices: KeyValueStorageServices())),
      ],
      child: const MaterialApp(
        title: 'Rick and Morty',
        home: SplashScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:rick_and_morty/providers/export.dart';
import 'package:rick_and_morty/screens/export.dart';
import 'package:rick_and_morty/services/export.dart';
import 'package:rick_and_morty/themes/app_theme.dart';

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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (_) => CharacterProvider(
                characterService: CharacterServiceImpl(),
                keyValueStorageServices: KeyValueStorageServices())),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rick and Morty',
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

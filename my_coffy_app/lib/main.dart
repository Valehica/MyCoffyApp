import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/NavegaciónPrincipal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicatzion.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 115, 72, 36)),
        useMaterial3: true,
      ),
      home: const BottomNavigationBarApp(),
    );
  }
}

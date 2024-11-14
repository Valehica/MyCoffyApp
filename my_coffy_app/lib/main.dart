import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/logginScreen.dart';
import 'package:my_coffy_app/utils/DBhelper.dart';
import 'dart:async';

import 'package:my_coffy_app/models/paletaDeColores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.InitDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.medio),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

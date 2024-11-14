import 'package:flutter/material.dart';

class MirecetasPage extends StatelessWidget {
  const MirecetasPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Esta es la Mis Recetas Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

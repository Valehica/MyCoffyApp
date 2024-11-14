import 'package:flutter/material.dart';

class MiopinionPage extends StatelessWidget {
  const MiopinionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Esta es la Mi Opinnion Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

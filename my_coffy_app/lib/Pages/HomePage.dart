import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Esta es la Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

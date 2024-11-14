import 'package:flutter/material.dart';

class MibaristaPage extends StatelessWidget {
  const MibaristaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Esta es la Mi barista Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

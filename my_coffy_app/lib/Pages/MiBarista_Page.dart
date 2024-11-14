import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/Pages/recetaCard.dart';

class MiBarista extends StatefulWidget {
  @override
  _MiBaristaState createState() => _MiBaristaState();
}

class _MiBaristaState extends State<MiBarista> {
  List<Receta> _recetas = [];

  // Método para cargar las recetas desde el archivo JSON
  Future<void> cargarRecetas() async {
    final String response = await rootBundle.loadString('assets/recetas.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _recetas = data.map((json) => Receta.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    cargarRecetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Barista"),
      ),
      body: _recetas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recetas.length,
              itemBuilder: (context, index) {
                return RecetaCard(receta: _recetas[index]);
              },
            ),
    );
  }
}

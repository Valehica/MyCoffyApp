import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/Pages/MiBarista_Page.dart';
import 'package:my_coffy_app/Pages/recetaCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Receta> ultimasRecetasVistas = [];
  List<Receta> recetasPreparadas = [];

  List<Receta> todasLasRecetas = [];

  // Método para cargar las recetas desde el archivo JSON
  Future<void> cargarRecetas() async {
    final String response = await rootBundle.loadString('assets/recetas.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      todasLasRecetas = data.map((json) => Receta.fromJson(json)).toList();
      // Filtrar recetas preparadas
      recetasPreparadas =
          todasLasRecetas.where((receta) => receta.preparada > 0).toList();
    });
  }

  // Función para registrar una receta como vista
  void registrarRecetaVista(Receta receta) {
    setState(() {
      if (!ultimasRecetasVistas.contains(receta)) {
        ultimasRecetasVistas.add(receta);
      }
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
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección Últimas Recetas Vistas
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Últimas Recetas Vistas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ultimasRecetasVistas.isNotEmpty
                ? SizedBox(
                    height: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ultimasRecetasVistas.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              registrarRecetaVista(ultimasRecetasVistas[index]),
                          child:
                              RecetaCard(receta: ultimasRecetasVistas[index]),
                        );
                      },
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MiBarista()),
                        );
                      },
                      child: Text('Revisa las recetas'),
                    ),
                  ),

            // Sección Recetas Preparadas
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recetas Preparadas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            recetasPreparadas.isNotEmpty
                ? SizedBox(
                    height: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recetasPreparadas.length,
                      itemBuilder: (context, index) {
                        return RecetaCard(receta: recetasPreparadas[index]);
                      },
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MiBarista()),
                        );
                      },
                      child: Text('Revisa las recetas'),
                    ),
                  ),

            // Sección Crear Nueva Receta
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '¿Quieres crear una nueva receta?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes navegar a la pantalla de creación de recetas
                },
                child: Text('Crea tu receta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

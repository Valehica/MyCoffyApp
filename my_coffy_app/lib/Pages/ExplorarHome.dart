import 'package:flutter/material.dart';
import 'package:my_coffy_app/recetaCard.dart';
import 'package:my_coffy_app/recetasDescripcion.dart';

Recetas recetas = Recetas();

class ExplorarHomeScreen extends StatelessWidget {
  const ExplorarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Marcas de cafe mejor valoradas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Encuentralas en tu supermercado mas cercano',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: recetas.todasRecetas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final receta = recetas.todasRecetas.toList()[index];
                  return Container(
                    width: 300,
                    child: RecetaCard(receta: receta),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Explora los nuevos cafes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: recetas.todasRecetas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final receta = recetas.todasRecetas.toList()[index];
                  return Container(
                    width: 300,
                    child: RecetaCard(receta: receta),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

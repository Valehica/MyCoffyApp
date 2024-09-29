import 'package:flutter/material.dart';
import 'package:my_coffy_app/recetaCard.dart';
import 'package:my_coffy_app/recetasDescripcion.dart';

Recetas recetas = Recetas();

class FeedHomeScreen extends StatelessWidget {
  const FeedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: ListView.builder(
                itemCount: recetas.todasRecetas.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final receta = recetas.todasRecetas.toList()[index];
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          '@User212323', // Simula el nombre de usuario
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 400,
                          child: RecetaCard(receta: receta),
                        ),
                        SizedBox(height: 16)
                      ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

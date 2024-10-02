/*
Ventana para mostrar una receta, recibe un tipo de dato receta

 */

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_coffy_app/Pages/recetasDescripcion.dart';

class CreateRecetaScreen extends StatefulWidget {
  const CreateRecetaScreen({super.key});

  @override
  _CreateRecetaScreen createState() => _CreateRecetaScreen();
}

class _CreateRecetaScreen extends State<CreateRecetaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crea tu receta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Añade una imagen',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('close'))
                          ],
                          title: const Text('Se ha añadido la imagen'),
                        ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 93, 64, 55),
              ),
              child: const Text(
                'Añadir imagen',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            _buildAddDescription(context, 'Tiempo de preparación'),
            _buildAddDescription(context, 'Herramientas'),
            _buildAddDescription(context, 'Ingredientes'),
            _buildAddDescription(context, 'Tipo de grano'),
            _buildAddDescription(context, 'Tipo de cafetera'),
            _buildAddDescription(context, 'Descripción'),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('close'))
                          ],
                          title: const Text('Se ha publicado la receta'),
                        ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 93, 64, 55),
              ),
              child: const Text(
                'Publicar receta',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddDescription(BuildContext context, String tittle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: tittle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

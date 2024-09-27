/*
Ventana para mostrar una receta, recibe un tipo de dato receta

 */

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_coffy_app/recetasDescripcion.dart'; // Asegúrate de agregar esta dependencia en tu pubspec.yaml

class RecetaDetailScreen extends StatefulWidget {
  final Receta receta; // Cambiado para recibir un objeto Receta

  const RecetaDetailScreen({super.key, required this.receta});

  @override
  _RecetaDetailScreenState createState() => _RecetaDetailScreenState();
}

class _RecetaDetailScreenState extends State<RecetaDetailScreen> {
  double _rating = 0; // Variable para la calificación por estrellas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receta.titulo), // Muestra el título de la receta
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildImageCard(context, widget.receta.imagen), // Card con imagen
            _buildDescriptionCard(context, 'Tiempo de preparación',
                widget.receta.tiempoPreparacion, Colors.white.withOpacity(0.9)),
            _buildDescriptionCard(
                context,
                'Herramientas',
                widget.receta.herramientas.join(", "),
                Colors.white.withOpacity(0.9)),
            _buildDescriptionCard(context, 'Descripción',
                widget.receta.descripcion, Colors.white.withOpacity(0.9)),
            _buildRatingSection(
                context,
                widget.receta
                    .calificacion), // Sección de calificación por estrellas
          ],
        ),
      ),
    );
  }

  // Card de descripción
  Widget _buildDescriptionCard(
      BuildContext context, String title, String content, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 8), // Espacio entre el título y el subtítulo
                Text(
                  content,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Card para mostrar una imagen
  Widget _buildImageCard(BuildContext context, String imagen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imagen,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Sección de calificación por estrellas
  Widget _buildRatingSection(BuildContext context, double calificacion) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calificación de la receta',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RatingBar.builder(
                initialRating:
                    calificacion, // mostrar calificacion segun la calificacion de la receta
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ignoreGestures:
                    true, // opcion para que el usuario pueda cambiar la modificacion (true = no puede)
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // actualizacion del rating
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Calificación: $calificacion estrellas',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

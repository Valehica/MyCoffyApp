/*
Ventana para mostrar una receta, recibe un tipo de dato receta

 */

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/models/recetas.dart';

class RecetaDetailScreen extends StatefulWidget {
  final Receta receta;

  const RecetaDetailScreen({super.key, required this.receta});

  @override
  _RecetaDetailScreenState createState() => _RecetaDetailScreenState();
}

class _RecetaDetailScreenState extends State<RecetaDetailScreen> {
  final double _rating = 0;
  bool _isFavorito = false;

  @override
  void initState() {
    super.initState();
    _isFavorito = false; //widget.receta.esFavorito;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receta.titulo),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorito ? Icons.favorite : Icons.favorite_border,
              color: _isFavorito ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isFavorito = !_isFavorito;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg'),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '@user1238920',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            _buildImageCard(context, widget.receta.imagen),
            _buildDescriptionCard(context, 'Tiempo de preparación',
                widget.receta.tiempoPreparacion.toString(), 300),
            _buildDescriptionCard(
                context, 'Herramientas', widget.receta.productosAsociados, 300),
            _buildDescriptionCard(context, 'Ingredientes',
                widget.receta.ingredientes.join(", "), 300),
            _buildDescriptionCard(
                context, 'Tipo de grano', widget.receta.tipoGrano, 300),
            _buildDescriptionCard(
                context, 'Tipo de cafetera', widget.receta.tipoCafetera, 300),
            _buildStepsCard(context, 'Pasos', widget.receta.pasos, 300),
            _buildRatingSection(context, widget.receta.valoracionPromedio),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionCard(
      BuildContext context, String title, String content, double alto) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
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

  Widget _buildStepsCard(
      BuildContext context, String title, List<String> steps, double alto) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: steps.asMap().entries.map((entry) {
                    int idx = entry.key + 1;
                    String step = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '$idx. $step',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              const Text(
                'Calificación de la receta',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RatingBar.builder(
                initialRating: calificacion,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                ignoreGestures: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
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

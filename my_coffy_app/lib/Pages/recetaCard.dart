/*
Clase que funciona como base para crear cards de cada receta (recibe una receta de la clase receta)

*/

import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/RecetaVentana.dart';
import 'package:my_coffy_app/Pages/recetasDescripcion.dart';

class RecetaCard extends StatefulWidget {
  final Receta receta;

  RecetaCard({required this.receta});

  @override
  _RecetaCardState createState() => _RecetaCardState();
}

class _RecetaCardState extends State<RecetaCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Si se presiona

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecetaDetailScreen(receta: widget.receta)),
        );
      },
      child: Container(
        width: 300, // Ajusta el ancho según tus necesidades
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Control de la imagen
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  widget.receta.imagen,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Control de título
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.receta.titulo,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Control si es o no favorito
                        IconButton(
                          icon: Icon(
                            widget.receta.esFavorito
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: widget.receta.esFavorito ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.receta.esFavorito =
                                  !widget.receta.esFavorito;
                            });
                          },
                        ),
                      ],
                    ),
                    // Control del tiempo de preparación
                    Text(
                      'Tiempo de preparación: ${widget.receta.tiempoPreparacion}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    // Control calificación con estrellas
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            index < widget.receta.calificacion.round()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.receta.calificacion.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String categoryTitle;

  const CategoryDetailScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'Detalles sobre $categoryTitle',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

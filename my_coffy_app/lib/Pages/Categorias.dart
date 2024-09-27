/*
Clase para manejar el apartado de categorias, se crean 4 cards
*/

import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/Receta.dart';
import 'package:my_coffy_app/recetasDescripcion.dart'; //QUITAR DESPUES

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCategoryCard(context, 'Tipo de grano',
                const Color.fromARGB(255, 179, 179, 179)),
            _buildCategoryCard(context, 'Cafetera utilizada',
                const Color.fromARGB(255, 179, 179, 179)),
            _buildCategoryCard(context, 'Tiempo de preparación',
                const Color.fromARGB(255, 179, 179, 179)),
            _buildCategoryCard(context, 'Recetas Básicas',
                const Color.fromARGB(255, 179, 179, 179)),
          ],
        ),
      ),
    );
  }

  // Función para construir una Card
  Widget _buildCategoryCard(BuildContext context, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Espacio alrededor de las Cards
      child: InkWell(
        onTap: () {
          //Si se presiona
          Recetas todasLasRECETAS =
              new Recetas(); //QUITAR DESPUES (PARA PROBAR COMO SE VE UNA RECETA)
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecetaDetailScreen(
                    receta:
                        todasLasRECETAS.todasRecetas[0])), //MODIFICAR DESPUES
          );
        },
        child: Card(
          color: color, // Color de fondo de la Card
          child: SizedBox(
            width: double.infinity, // Ocupa todo el ancho disponible
            height: 130, // Altura de la Card
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Nueva pantalla para mostrar detalles de la categoría seleccionada
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

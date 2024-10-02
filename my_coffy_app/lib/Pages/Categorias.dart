/*
Clase para manejar el apartado de categorias, se crean 4 cards
*/
import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/RecetaVentana.dart';
import 'package:my_coffy_app/Pages/recetasDescripcion.dart';
import 'package:my_coffy_app/Pages/recetasDescripcion.dart';
import 'package:my_coffy_app/Pages/RecetasList.dart';

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
            _buidTittleCategory(context, 'Tipo de grano'),
            _buidOptionCategory(context, 'Arábica'),
            _buidOptionCategory(context, 'Robusta'),
            _buidTittleCategory(context, 'Cafetera utilizada'),
            _buidOptionCategory(context, 'Cafetera de goteo'),
            _buidOptionCategory(context, 'Cafetera espresso'),
            _buidOptionCategory(context, 'Cafetera turca'),
            _buidTittleCategory(context, 'Tiempo de preparación'),
            _buidOptionCategory(context, '5 minutos'),
            _buidOptionCategory(context, '10 minutos'),
            _buidOptionCategory(context, '15 minutos'),
            _buidTittleCategory(context, 'Recetas Básicas'),
            _buidOptionCategory(context, 'Recetas Básicas'),
          ],
        ),
      ),
    );
  }

  Widget _buidTittleCategory(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          color: const Color.fromARGB(255, 161, 136, 127),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Column(
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buidOptionCategory(BuildContext context, String title) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecetasScreen()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: const Color.fromARGB(197, 255, 255, 255),
              child: SizedBox(
                width: 350,
                height: 60,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 18),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // Función para construir una Card
  Widget _buildCategoryCard(BuildContext context, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Espacio alrededor de las Cards
      child: InkWell(
        onTap: () {},
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

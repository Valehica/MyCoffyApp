import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/recetaCard.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/models/recetas.dart';

Recetas recetas = Recetas(todasRecetas: List.empty());
Receta recetaScroll = recetas.todasRecetas[0];

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Valehica', // Simula el nombre de usuario
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Seguidores',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '120',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Seguidos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '80',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Recetas Favoritas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Recetas Favoritas
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: recetas.todasRecetas
                    .where((receta) => false) //receta.esFavorito)
                    .length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final receta = recetas.todasRecetas
                      .where((receta) => false) //receta.esFavorito)
                      .toList()[index];
                  return SizedBox(
                    width: 300,
                    child: RecetaCard(receta: receta),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Mis Recetas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: recetas.todasRecetas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final receta = recetas.todasRecetas.toList()[index];
                  return SizedBox(
                    width: 300,
                    child: RecetaCard(receta: receta),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
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
                          title: const Text('Se ha cerrado la seción'),
                        ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 93, 64, 55),
              ),
              child: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

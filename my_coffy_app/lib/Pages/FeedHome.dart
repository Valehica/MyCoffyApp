import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/recetaCard.dart';
import 'package:my_coffy_app/Pages/recetasDescripcion.dart';

Recetas recetas = Recetas();

class FeedHomeScreen extends StatelessWidget {
  const FeedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg'),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '@user1238920',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 400,
                    child: RecetaCard(receta: receta),
                  ),
                  SizedBox(height: 25)
                ]);
          },
        ),
      ),
    );
  }
}

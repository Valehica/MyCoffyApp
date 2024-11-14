import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/recetaCard.dart';
import 'package:my_coffy_app/models/ingredientes_class.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/models/recetas.dart';

Recetas recetas = Recetas(todasRecetas: new List.empty());

class MibaristaPage extends StatelessWidget {
  const MibaristaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar...',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),

        //filtro
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list,
                color: const Color.fromARGB(255, 93, 64, 55)),
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
                        title: const Text('Se ha aplicado el filtro'),
                      ));
            },
          ),
        ],
      ),
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

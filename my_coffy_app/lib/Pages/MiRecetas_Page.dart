import 'package:flutter/material.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/Pages/CrearRecera_Page.dart';
import 'package:my_coffy_app/Pages/recetaCard.dart';

class MisRecetasScreen extends StatefulWidget {
  @override
  _MisRecetasScreenState createState() => _MisRecetasScreenState();
}

class _MisRecetasScreenState extends State<MisRecetasScreen> {
  // Lista de recetas, inicialmente vacía
  List<Receta> todasLasRecetas = [];

  @override
  void initState() {
    super.initState();
    // Cargar las recetas al iniciar
    cargarRecetas();
  }

  // Simula cargar las recetas desde el archivo o base de datos
  void cargarRecetas() {
    // Aquí, filtramos solo las recetas donde esMia es true
    todasLasRecetas = todasLasRecetas.where((receta) => receta.esMia).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Recetas"),
      ),
      body: todasLasRecetas.isEmpty
          ? Center(child: Text("No tienes recetas guardadas"))
          : ListView.builder(
              itemCount: todasLasRecetas.length,
              itemBuilder: (context, index) {
                return RecetaCard(receta: todasLasRecetas[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navegar a la pantalla para crear una nueva receta
          Receta? nuevaReceta = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CrearRecetaPage()),
          );

          // Si se ha recibido una receta, agregarla a la lista
          if (nuevaReceta != null) {
            setState(() {
              todasLasRecetas.add(nuevaReceta);
              cargarRecetas(); // Asegúrate de filtrar las recetas si es necesario
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'receta_class.dart';

class Recetas {
  List<Receta> todasRecetas = [];

  Future<void> cargarRecetasDesdeJson(String path) async {
    try {
      final file = File(path);
      final contenido = await file.readAsString();
      final List<dynamic> recetasJson = jsonDecode(contenido);

      todasRecetas = recetasJson
          .map((json) => Receta.fromJson(json as Map<String, dynamic>))
          .toList();
      print("Recetas cargadas exitosamente."); // Mensaje de verificación
    } catch (e) {
      print("Error al cargar las recetas: $e"); // Manejo de error
    }
  }
}

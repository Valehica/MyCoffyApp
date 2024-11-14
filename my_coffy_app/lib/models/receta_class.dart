import 'dart:convert';
import 'usuario_class.dart';
import 'ingredientes_class.dart';
import 'comentarios_class.dart';

class Receta {
  String titulo;
  String imagen;
  List<Ingrediente> ingredientes;
  List<String> pasos;
  String productosAsociados;
  int tiempoPreparacion;
  String tipoCafetera;
  String tipoGrano;
  Usuario usuarioCreador;
  double valoracionPromedio;
  List<Comentario> comentarios;

  Receta({
    required this.titulo,
    required this.imagen,
    required this.ingredientes,
    required this.pasos,
    required this.productosAsociados,
    required this.tiempoPreparacion,
    required this.tipoCafetera,
    required this.tipoGrano,
    required this.usuarioCreador,
    this.valoracionPromedio = 0.0,
    this.comentarios = const [],
  });

  // Método para cargar una receta desde un JSON
  factory Receta.fromJson(Map<String, dynamic> json) {
    return Receta(
      titulo: json['titulo'],
      imagen: json['imagen'],
      ingredientes: (json['ingredientes'] as List)
          .map((i) => Ingrediente.fromJson(i))
          .toList(),
      pasos: List<String>.from(json['pasos']),
      productosAsociados: json['productosAsociados'],
      tiempoPreparacion: json['tiempoPreparacion'],
      tipoCafetera: json['tipoCafetera'],
      tipoGrano: json['tipoGrano'],
      usuarioCreador: Usuario.fromJson(json['usuarioCreador']),
      valoracionPromedio: json['valoracionPromedio'],
      comentarios: (json['comentarios'] as List)
          .map((c) => Comentario.fromJson(c))
          .toList(),
    );
  }

  // Método para agregar un comentario
  void agregarComentario(Comentario comentario) {
    comentarios.add(comentario);
    calcularValoracionPromedio();
  }

  // Método para calcular la valoración promedio
  void calcularValoracionPromedio() {
    if (comentarios.isNotEmpty) {
      valoracionPromedio = comentarios
              .map((comentario) => comentario.calificacion)
              .reduce((a, b) => a + b) /
          comentarios.length;
    } else {
      valoracionPromedio = 0.0;
    }
  }
}

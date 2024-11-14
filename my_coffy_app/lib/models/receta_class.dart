import 'dart:convert';
import 'usuario_class.dart';

class Receta {
  late String titulo;
  late String imagen;
  late List<String> ingredientes;
  late List<String> pasos;
  late List<String> productosAsociados;
  late int tiempoPreparacion;
  late String tipoCafetera;
  late String tipoGrano;
  late Usuario usuarioCreador;
  late double valoracionPromedio;
  late bool favorita;

  Receta(
      this.titulo,
      this.imagen,
      this.ingredientes,
      this.pasos,
      this.productosAsociados,
      this.tiempoPreparacion,
      this.tipoCafetera,
      this.tipoGrano,
      this.usuarioCreador,
      this.valoracionPromedio);

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'imagen': imagen,
      'ingredientes': ingredientes,
      'pasos': pasos,
      'productosAsociados': productosAsociados,
      'tiempoPreparacion': tiempoPreparacion,
      'tipoCafetera': tipoCafetera,
      'tipoGrano': tipoGrano,
      'usuarioCreador': usuarioCreador,
      'valoracionPromedio': valoracionPromedio,
    };
  }

  // Método para cargar una receta desde un JSON
  Receta.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'] as String;
    imagen = json['imagen'] as String;
    ingredientes = List<String>.from(json['ingredientes'] as List);
    pasos = List<String>.from(json['pasos'] as List);
    productosAsociados = List<String>.from(json['productosAsociados'] as List);
    tiempoPreparacion = json['tiempoPreparacion'] as int;
    tipoCafetera = json['tipoCafetera'] as String;
    tipoGrano = json['tipoGrano'] as String;
    usuarioCreador = json['usuarioCreador'] as Usuario;
    valoracionPromedio = json['valoracionPromedio'] as double;
    favorita = json['favorita'] as bool;
  }
/*
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
  }*/
}

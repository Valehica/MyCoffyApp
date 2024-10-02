import 'usuario_class.dart';
import 'ingredientes_class.dart';
import 'comentarios_class.dart';

class Receta {
  String titulo;
  String imagen;
  String descripcion;
  List<Ingrediente> ingredientes;
  String herramientas;
  int tiempoPreparacion;
  String tipoCafetera;
  String tipoGrano;
  Usuario usuarioCreador;
  double valoracionPromedio;
  List<Comentario> comentarios;

  Receta({
    required this.titulo,
    required this.imagen,
    required this.descripcion,
    required this.ingredientes,
    required this.herramientas,
    required this.tiempoPreparacion,
    required this.tipoCafetera,
    required this.tipoGrano,
    required this.usuarioCreador,
    this.valoracionPromedio = 0.0,
    this.comentarios = const [],
  });

  void agregarComentario(Comentario comentario) {
    //funcion para agregar un comentario
  }

  void calcularValoracionPromedio() {
    //Funcion para calcular la valoracion promedio
  }
}

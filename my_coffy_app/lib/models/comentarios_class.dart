import 'usuario_class.dart';

class Comentario {
  Usuario usuario;
  String contenido;
  DateTime fecha;
  double valoracion;
  String imagen;

  Comentario({
    required this.usuario,
    required this.contenido,
    required this.fecha,
    required this.valoracion,
    required this.imagen,
  });
}

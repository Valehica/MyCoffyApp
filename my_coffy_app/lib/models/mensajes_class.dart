import 'usuario_class.dart';

class Mensaje {
  Usuario remitente;
  String contenido;
  DateTime fechaEnvio;

  Mensaje({
    required this.remitente,
    required this.contenido,
    required this.fechaEnvio,
  });
}

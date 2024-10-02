import 'usuario_class.dart';
import 'mensajes_class.dart';

class Chat {
  List<Usuario> participantes;
  List<Mensaje> mensajes;

  Chat({
    required this.participantes,
    this.mensajes = const [],
  });

  void enviarMensaje(Mensaje mensaje) {
    //Funcion para enviar mensajes
  }
}

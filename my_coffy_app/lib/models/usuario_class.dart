import 'receta_class.dart';

class Usuario {
  String nombreUsuario;
  String email;
  String contrasenia;
  List<Receta> listaRecetasFavoritas;
  List<Usuario> seguidores;
  List<Usuario> seguidos;
  List<Usuario> seguidosDeSeguidos;

  Usuario({
    required this.nombreUsuario,
    required this.email,
    required this.contrasenia,
    this.listaRecetasFavoritas = const [],
    this.seguidores = const [],
    this.seguidos = const [],
    this.seguidosDeSeguidos = const [],
  });

  void seguir(Usuario usuario) {
    //Funcion para agregar seguido
  }

  void dejarDeSeguir(Usuario usuario) {
    //Funcion para agregar seguidor
  }

  void recomendaciones(Usuario usuario) {
    //Funcion para recomendar recetas (mostrara recetas de los seguidos de tus seguidos)
  }
}

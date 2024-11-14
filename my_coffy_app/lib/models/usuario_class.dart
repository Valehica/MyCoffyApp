import 'dart:convert';
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

  // Método toJson para serializar Usuario a JSON
  Map<String, dynamic> toJson() {
    return {
      'nombreUsuario': nombreUsuario,
      'email': email,
      'contrasenia': contrasenia,
      'listaRecetasFavoritas':
          listaRecetasFavoritas.map((receta) => receta.toJson()).toList(),
      'seguidores': seguidores.map((usuario) => usuario.toJson()).toList(),
      'seguidos': seguidos.map((usuario) => usuario.toJson()).toList(),
      'seguidosDeSeguidos':
          seguidosDeSeguidos.map((usuario) => usuario.toJson()).toList(),
    };
  }

  // Método fromJson para deserializar JSON a Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombreUsuario: json['nombreUsuario'] as String,
      email: json['email'] as String,
      contrasenia: json['contrasenia'] as String,
      listaRecetasFavoritas: (json['listaRecetasFavoritas'] as List<dynamic>)
          .map((recetaJson) =>
              Receta.fromJson(recetaJson as Map<String, dynamic>))
          .toList(),
      seguidores: (json['seguidores'] as List<dynamic>)
          .map((usuarioJson) =>
              Usuario.fromJson(usuarioJson as Map<String, dynamic>))
          .toList(),
      seguidos: (json['seguidos'] as List<dynamic>)
          .map((usuarioJson) =>
              Usuario.fromJson(usuarioJson as Map<String, dynamic>))
          .toList(),
      seguidosDeSeguidos: (json['seguidosDeSeguidos'] as List<dynamic>)
          .map((usuarioJson) =>
              Usuario.fromJson(usuarioJson as Map<String, dynamic>))
          .toList(),
    );
  }

  void seguir(Usuario usuario) {}

  void dejarDeSeguir(Usuario usuario) {}

  void recomendaciones() {}
}

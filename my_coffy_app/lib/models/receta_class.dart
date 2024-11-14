class Receta {
  String titulo;
  List<String> ingredientes;
  List<String> pasos;
  int tiempoPreparacion;
  double valoracionPromedio;
  bool favorita;
  int preparada;
  bool esMia;
  String usuarioCreador;
  String tipoGrano;
  String tipoCafetera;
  List<String> productosAsociados;
  String imagen;

  Receta({
    required this.titulo,
    required this.ingredientes,
    required this.pasos,
    required this.tiempoPreparacion,
    required this.valoracionPromedio,
    required this.favorita,
    required this.preparada,
    required this.esMia,
    required this.usuarioCreador,
    required this.tipoGrano,
    required this.tipoCafetera,
    required this.productosAsociados,
    required this.imagen,
  });

  // Método para convertir la receta en un mapa para guardar en JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'ingredientes': ingredientes,
      'pasos': pasos,
      'tiempoPreparacion': tiempoPreparacion,
      'valoracionPromedio': valoracionPromedio,
      'favorita': favorita,
      'preparada': preparada,
      'esMia': esMia,
      'usuarioCreador': usuarioCreador,
      'tipoGrano': tipoGrano,
      'tipoCafetera': tipoCafetera,
      'productosAsociados': productosAsociados,
      'imagen': imagen,
    };
  }

  // Método para crear una receta a partir de un mapa (decodificar JSON)
  factory Receta.fromJson(Map<String, dynamic> json) {
    return Receta(
      titulo: json['titulo'],
      ingredientes: List<String>.from(json['ingredientes']),
      pasos: List<String>.from(json['pasos']),
      tiempoPreparacion: json['tiempoPreparacion'],
      valoracionPromedio: json['valoracionPromedio'],
      favorita: json['favorita'],
      preparada: json['preparada'],
      esMia: json['esMia'],
      usuarioCreador: json['usuarioCreador'],
      tipoGrano: json['tipoGrano'],
      tipoCafetera: json['tipoCafetera'],
      productosAsociados: List<String>.from(json['productosAsociados']),
      imagen: json['imagen'],
    );
  }
}

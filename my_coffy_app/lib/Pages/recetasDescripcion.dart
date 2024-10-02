/*
Clase para controlar la base de datos de las recetas
Esta clase solo existe en este programa para agilizar el proceso
de mostrar las recetas en el prototitpo, en un futuro se planea implementar
las clases reales existentes en el models
*/

class Receta {
  String imagen;
  String titulo;
  List<String> herramientas;
  String tiempoPreparacion;
  List<String> ingredientes;
  String descripcion;
  String tipoGrano;
  String tipoCafetera;
  bool esFavorito;
  double calificacion;
  String usuario;

  // Constructor
  Receta(
      {required this.imagen,
      required this.titulo,
      required this.herramientas,
      required this.tiempoPreparacion,
      required this.ingredientes,
      required this.descripcion,
      required this.tipoGrano,
      required this.tipoCafetera,
      required this.esFavorito,
      required this.calificacion,
      required this.usuario});
}

class Recetas {
  List<Receta> todasRecetas = [];

  // Constructor
  Recetas() {
    // Cargar recetas iniciales
    todasRecetas.add(Receta(
      imagen: "https://www.somoselcafe.com.ar/img/novedades/47.jpg",
      titulo: "Café Americano",
      herramientas: ["Taza", "Cafetera", "Cuchara"],
      tiempoPreparacion: "5 minutos",
      ingredientes: ["Agua caliente", "Café molido"],
      descripcion:
          "Un café fuerte y ligero hecho con agua caliente y café espresso.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera de goteo",
      esFavorito: true,
      calificacion: 4.5,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://athome.starbucks.com/sites/default/files/2022-04/CAH_ClassicLatte_Hero_0.jpg",
      titulo: "Café Latte",
      herramientas: ["Taza", "Espumador de leche", "Cafetera"],
      tiempoPreparacion: "10 minutos",
      ingredientes: ["Café espresso", "Leche", "Espuma de leche"],
      descripcion:
          "Una mezcla suave de café espresso y leche vaporizada con espuma.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera espresso",
      esFavorito: false,
      calificacion: 4.0,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://www.thespruceeats.com/thmb/POPhcPYBWx7fNJu8Bc7YjS-Flso=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-mocha-4797918-hero-01-1-f8fb7ebd74914895b61366f6fc1d4b05.jpg",
      titulo: "Café Mocha",
      herramientas: ["Taza", "Cafetera", "Cuchara", "Espumador de leche"],
      tiempoPreparacion: "10 minutos",
      ingredientes: ["Café espresso", "Leche", "Chocolate", "Crema batida"],
      descripcion:
          "Café espresso con leche vaporizada y chocolate, cubierto con crema batida.",
      tipoGrano: "Robusta",
      tipoCafetera: "Cafetera espresso",
      esFavorito: true,
      calificacion: 4.8,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://perfectdailygrind.com/es/wp-content/uploads/sites/2/2020/03/Cortadito-Cover-1.png",
      titulo: "Café Cortado",
      herramientas: ["Taza", "Cafetera"],
      tiempoPreparacion: "5 minutos",
      ingredientes: ["Café espresso", "Leche caliente"],
      descripcion:
          "Café espresso con una pequeña cantidad de leche caliente, que reduce la acidez.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera espresso",
      esFavorito: false,
      calificacion: 4.2,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRfS4RzRbZlfOsCCHm6K09Ks-tqgTUz0sO0w&s",
      titulo: "Café con Leche",
      herramientas: ["Taza", "Cafetera"],
      tiempoPreparacion: "5 minutos",
      ingredientes: ["Café molido", "Leche", "Azúcar"],
      descripcion:
          "Café negro mezclado con leche caliente y endulzado al gusto.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera de goteo",
      esFavorito: false,
      calificacion: 3.5,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://jumboalacarta.com.ar/wp-content/uploads/2021/06/DSC_6236-1024x683.jpg",
      titulo: "Affogato",
      herramientas: ["Taza", "Cuchara"],
      tiempoPreparacion: "5 minutos",
      ingredientes: ["Helado", "Café caliente"],
      descripcion:
          "Un postre italiano que consiste en helado bañado con café caliente.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera espresso",
      esFavorito: false,
      calificacion: 4.3,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen: "https://i.blogs.es/6a9c70/cafe_turco/1366_2000.jpeg",
      titulo: "Café Turco",
      herramientas: ["Cafetera turca", "Taza", "Cuchara"],
      tiempoPreparacion: "15 minutos",
      ingredientes: ["Café molido fino", "Agua", "Azúcar"],
      descripcion:
          "Café preparado en una cafetera especial, servido sin filtrar.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera turca",
      esFavorito: false,
      calificacion: 4.1,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT907tjK4FvpayoEfnyYKQkSiUnH2GE6gwp0g&s",
      titulo: "Café Frío",
      herramientas: ["Vaso", "Cafetera", "Cuchara"],
      tiempoPreparacion: "5 minutos",
      ingredientes: [
        "Café preparado",
        "Hielo",
        "Leche (opcional)",
        "Azúcar (opcional)"
      ],
      descripcion: "Café servido frío, ideal para días calurosos.",
      tipoGrano: "Robusta",
      tipoCafetera: "Cafetera de goteo",
      esFavorito: false,
      calificacion: 4.6,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen: "https://imag.bonviveur.com/cafe-bombon.jpg",
      titulo: "Café Bombón",
      herramientas: ["Taza", "Cuchara"],
      tiempoPreparacion: "5 minutos",
      ingredientes: ["Café espresso", "Leche condensada"],
      descripcion:
          "Café espresso endulzado con leche condensada, un dulce deleite.",
      tipoGrano: "Arábica",
      tipoCafetera: "Cafetera espresso",
      esFavorito: false,
      calificacion: 4.7,
      usuario: '@User342342',
    ));

    todasRecetas.add(Receta(
      imagen:
          "https://i0.wp.com/commememucho.com/wp-content/uploads/2018/08/irish-coffee.jpg",
      titulo: "Café Irlandés",
      herramientas: ["Taza", "Cuchara"],
      tiempoPreparacion: "5 minutos",
      ingredientes: ["Café caliente", "Whisky", "Crema"],
      descripcion:
          "Café caliente con whisky irlandés y crema, una bebida reconfortante.",
      tipoGrano: "Robusta",
      tipoCafetera: "Cafetera de goteo",
      esFavorito: false,
      calificacion: 4.4,
      usuario: '@User342342',
    ));
  }
}

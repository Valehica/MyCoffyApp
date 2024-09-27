/*
Clase para controlar la base de datos de las recetas
 */

class Receta {
  String imagen;
  String titulo; // Título de la receta
  List<String> herramientas; // Herramientas necesarias
  String tiempoPreparacion; // Tiempo de preparación
  List<String> ingredientes; // Ingredientes de la receta
  String descripcion; // Descripción de la receta
  bool esFavorito;
  double calificacion;

  // Constructor
  Receta({
    required this.imagen,
    required this.titulo,
    required this.herramientas,
    required this.tiempoPreparacion,
    required this.ingredientes,
    required this.descripcion,
    required this.esFavorito,
    required this.calificacion,
  });
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
        esFavorito: true,
        calificacion: 4.5)); // Calificación

    todasRecetas.add(Receta(
        imagen:
            "https://athome.starbucks.com/sites/default/files/2022-04/CAH_ClassicLatte_Hero_0.jpg",
        titulo: "Café Latte",
        herramientas: ["Taza", "Espumador de leche", "Cafetera"],
        tiempoPreparacion: "10 minutos",
        ingredientes: ["Café espresso", "Leche", "Espuma de leche"],
        descripcion:
            "Una mezcla suave de café espresso y leche vaporizada con espuma.",
        esFavorito: false,
        calificacion: 4.0)); // Calificación

    todasRecetas.add(Receta(
        imagen:
            "https://www.thespruceeats.com/thmb/POPhcPYBWx7fNJu8Bc7YjS-Flso=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-mocha-4797918-hero-01-1-f8fb7ebd74914895b61366f6fc1d4b05.jpg",
        titulo: "Café Mocha",
        herramientas: ["Taza", "Cafetera", "Cuchara", "Espumador de leche"],
        tiempoPreparacion: "10 minutos",
        ingredientes: ["Café espresso", "Leche", "Chocolate", "Crema batida"],
        descripcion:
            "Café espresso con leche vaporizada y chocolate, cubierto con crema batida.",
        esFavorito: true,
        calificacion: 4.8)); // Calificación

    todasRecetas.add(Receta(
        imagen:
            "https://perfectdailygrind.com/es/wp-content/uploads/sites/2/2020/03/Cortadito-Cover-1.png",
        titulo: "Café Cortado",
        herramientas: ["Taza", "Cafetera"],
        tiempoPreparacion: "5 minutos",
        ingredientes: ["Café espresso", "Leche caliente"],
        descripcion:
            "Café espresso con una pequeña cantidad de leche caliente, que reduce la acidez.",
        esFavorito: false,
        calificacion: 4.2)); // Calificación

    todasRecetas.add(Receta(
        imagen:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRfS4RzRbZlfOsCCHm6K09Ks-tqgTUz0sO0w&s",
        titulo: "Café con Leche",
        herramientas: ["Taza", "Cafetera"],
        tiempoPreparacion: "5 minutos",
        ingredientes: ["Café molido", "Leche", "Azúcar"],
        descripcion:
            "Café negro mezclado con leche caliente y endulzado al gusto.",
        esFavorito: false,
        calificacion: 3.5)); // Calificación

    todasRecetas.add(Receta(
        imagen:
            "https://jumboalacarta.com.ar/wp-content/uploads/2021/06/DSC_6236-1024x683.jpg",
        titulo: "Affogato",
        herramientas: ["Taza", "Cuchara"],
        tiempoPreparacion: "5 minutos",
        ingredientes: ["Helado", "Café caliente"],
        descripcion:
            "Un postre italiano que consiste en helado bañado con café caliente.",
        esFavorito: false,
        calificacion: 4.3)); // Calificación

    todasRecetas.add(Receta(
        imagen: "https://i.blogs.es/6a9c70/cafe_turco/1366_2000.jpeg",
        titulo: "Café Turco",
        herramientas: ["Cafetera turca", "Taza", "Cuchara"],
        tiempoPreparacion: "15 minutos",
        ingredientes: ["Café molido fino", "Agua", "Azúcar"],
        descripcion:
            "Café preparado en una cafetera especial, servido sin filtrar.",
        esFavorito: false,
        calificacion: 4.1)); // Calificación

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
        esFavorito: false,
        calificacion: 4.6)); // Calificación

    todasRecetas.add(Receta(
        imagen: "https://imag.bonviveur.com/cafe-bombon.jpg",
        titulo: "Café Bombón",
        herramientas: ["Taza", "Cuchara"],
        tiempoPreparacion: "5 minutos",
        ingredientes: ["Café espresso", "Leche condensada"],
        descripcion:
            "Café espresso endulzado con leche condensada, un dulce deleite.",
        esFavorito: false,
        calificacion: 4.7)); // Calificación

    todasRecetas.add(Receta(
        imagen:
            "https://i0.wp.com/commememucho.com/wp-content/uploads/2018/08/irish-coffee.jpg",
        titulo: "Café irlandés",
        herramientas: ["Taza", "Cuchara"],
        tiempoPreparacion: "5 minutos",
        ingredientes: ["Café caliente", "Whisky", "Crema"],
        descripcion:
            "Café caliente con whisky irlandés y crema, una bebida reconfortante.",
        esFavorito: false,
        calificacion: 4.4)); // Calificación
  }
}

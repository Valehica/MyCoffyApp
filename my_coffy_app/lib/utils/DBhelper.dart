import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static late final Future<Database> database;

  static _onCreate(Database db, int version) async {
    // Crear la tabla `recipes` con todas las columnas necesarias
    await db.execute('''
      CREATE TABLE recipes (
        titulo TEXT,
        imagen TEXT,
        ingredientes TEXT,          -- JSON String
        pasos TEXT,                  -- JSON String
        productosAsociados TEXT,     -- JSON String
        tiempoPreparacion INTEGER,
        tipoCafetera TEXT,
        tipoGrano TEXT,
        usuarioCreador TEXT,
        valoracionPromedio REAL,
        favorita INTEGER,            -- Booleano (0 o 1)
        preparada INTEGER,           -- Entero
        esMia INTEGER                -- Booleano (0 o 1)
      )
    ''');

    // Cargar todas las recetas desde el archivo JSON y guardarlas en la base de datos
    String jsonData = await readAsset('assets/recetas.json');
    List<dynamic> recetasList = jsonDecode(jsonData);

    // Iterar sobre cada receta y guardarla en la tabla
    for (var recetaJson in recetasList) {
      await db.insert('recipes', {
        'titulo': recetaJson['titulo'],
        'imagen': recetaJson['imagen'],
        'ingredientes': jsonEncode(recetaJson['ingredientes']),
        'pasos': jsonEncode(recetaJson['pasos']),
        'productosAsociados': jsonEncode(recetaJson['productosAsociados']),
        'tiempoPreparacion': recetaJson['tiempoPreparacion'],
        'tipoCafetera': recetaJson['tipoCafetera'],
        'tipoGrano': recetaJson['tipoGrano'],
        'usuarioCreador': recetaJson['usuarioCreador'],
        'valoracionPromedio': recetaJson['valoracionPromedio'],
        'favorita': recetaJson['favorita'] ? 1 : 0,
        'preparada': recetaJson['preparada'],
        'esMia': recetaJson['esMia'] ? 1 : 0,
      });
    }

    print("Recetas insertadas en la base de datos.");
  }

  static Future<void> InitDatabase() async {
    var databasesPath = await getDatabasesPath();
    try {
      await Directory(databasesPath).create(recursive: true);
    } catch (_) {
      print("ERROR FATAL***************************************************");
    }

    database = openDatabase(
      join(await getDatabasesPath(), "coffee_db"),
      onCreate: _onCreate,
      version: 1,
    );
  }

  // Guardar una receta en la base de datos
  static Future<void> AddRecipe(Receta r) async {
    try {
      final db = await database;

      // Verificar que los campos esenciales no sean nulos
      if (r.titulo.isEmpty || r.imagen.isEmpty || r.ingredientes.isEmpty) {
        throw Exception("Campos esenciales no pueden estar vacíos.");
      }

      Map<String, Object?> data = {
        'titulo': r.titulo,
        'imagen': r.imagen,
        'ingredientes': jsonEncode(r.ingredientes),
        'pasos': jsonEncode(r.pasos),
        'productosAsociados': jsonEncode(r.productosAsociados),
        'tiempoPreparacion': r.tiempoPreparacion,
        'tipoCafetera': r.tipoCafetera,
        'tipoGrano': r.tipoGrano,
        'usuarioCreador': r.usuarioCreador,
        'valoracionPromedio': r.valoracionPromedio,
        'favorita': r.favorita ? 1 : 0, // Booleano convertido a INTEGER
        'preparada': r.preparada, // Entero
        'esMia': r.esMia ? 1 : 0 // Booleano convertido a INTEGER
      };

      // Intentar insertar la receta en la base de datos
      await db.insert('recipes', data,
          conflictAlgorithm: ConflictAlgorithm.replace);

      print("Receta añadida correctamente.");
    } catch (e) {
      print("Error al agregar receta: $e");
    }
  }

  // Obtener todas las recetas
  static Future<List<Receta>> GetRecipes() async {
    final db = await database;
    final List<Map<String, Object?>> dbMaps = await db.query('recipes');
    return dbMaps.map((map) => _mapToReceta(map)).toList();
  }

  // Obtener recetas favoritas
  static Future<List<Receta>> GetFavoriteRecipes() async {
    final db = await database;
    final List<Map<String, Object?>> dbMaps =
        await db.query('recipes', where: 'favorita = ?', whereArgs: [1]);
    return dbMaps.map((map) => _mapToReceta(map)).toList();
  }

  // Método auxiliar para convertir datos de la base de datos en objeto `Receta`
  static Receta _mapToReceta(Map<String, Object?> map) {
    return Receta(
        titulo: map['titulo'] as String,
        imagen: map['imagen'] as String,
        ingredientes:
            List<String>.from(jsonDecode(map['ingredientes'] as String)),
        pasos: List<String>.from(jsonDecode(map['pasos'] as String)),
        productosAsociados:
            List<String>.from(jsonDecode(map['productosAsociados'] as String)),
        tiempoPreparacion: map['tiempoPreparacion'] as int,
        tipoCafetera: map['tipoCafetera'] as String,
        tipoGrano: map['tipoGrano'] as String,
        usuarioCreador: map['usuarioCreador'] as String,
        valoracionPromedio: map['valoracionPromedio'] as double,
        favorita: (map['favorita'] as int) == 1, // Convertir INTEGER a bool
        preparada: map['preparada'] as int,
        esMia: (map['esMia'] as int) == 1 // Convertir INTEGER a bool
        );
  }

  static Future<String> readAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}

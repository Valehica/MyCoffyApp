import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:my_coffy_app/utils/DBhelper.dart';

class CrearRecetaPage extends StatefulWidget {
  @override
  _CrearRecetaPageState createState() => _CrearRecetaPageState();
}

class _CrearRecetaPageState extends State<CrearRecetaPage> {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController tiempoPreparacionController =
      TextEditingController();

  List<TextEditingController> _ingredientControllers = [];
  List<TextEditingController> _stepControllers = [];
  List<TextEditingController> _productControllers = [];

  String tipoGrano = 'Arábica';
  String tipoCafetera = 'Espresso';
  File? imagen;

  // Función para agregar un nuevo campo de ingrediente
  void _addIngredientField() {
    setState(() {
      _ingredientControllers.add(TextEditingController());
    });
  }

  // Función para agregar un nuevo campo de paso
  void _addStepField() {
    setState(() {
      _stepControllers.add(TextEditingController());
    });
  }

  // Función para agregar un nuevo campo de producto asociado
  void _addProductField() {
    setState(() {
      _productControllers.add(TextEditingController());
    });
  }

  // Guardar la receta creada
  void guardarReceta() async {
    // Obtener los valores de los ingredientes, pasos y productos
    List<String> ingredientes = _ingredientControllers
        .map((controller) => controller.text)
        .where((ingredient) =>
            ingredient.isNotEmpty) // Filtrar ingredientes vacíos
        .toList();

    List<String> pasos = _stepControllers
        .map((controller) => controller.text)
        .where((step) => step.isNotEmpty) // Filtrar pasos vacíos
        .toList();

    List<String> productosAsociados = _productControllers
        .map((controller) => controller.text)
        .where((product) => product.isNotEmpty) // Filtrar productos vacíos
        .toList();

    // Crear la nueva receta
    Receta nuevaReceta = Receta(
      titulo: tituloController.text,
      imagen: imagen != null ? imagen!.path : '',
      ingredientes: ingredientes,
      pasos: pasos,
      productosAsociados: productosAsociados,
      tiempoPreparacion: int.tryParse(tiempoPreparacionController.text) ?? 0,
      tipoCafetera: tipoCafetera,
      tipoGrano: tipoGrano,
      usuarioCreador: 'valehica',
      preparada: 0,
      favorita: false,
      esMia: true,
      valoracionPromedio: 0,
    );

    // Guardar la receta en la base de datos
    await DBHelper.AddRecipe(nuevaReceta);

    // Volver a la página anterior
    Navigator.pop(context, nuevaReceta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Nueva Receta"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 10),

            // Ingredientes
            Text("Ingredientes"),
            ..._ingredientControllers.map((controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Ingrediente',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un ingrediente';
                    }
                    return null;
                  },
                ),
              );
            }).toList(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addIngredientField,
            ),

            SizedBox(height: 10),

            // Pasos
            Text("Pasos"),
            ..._stepControllers.map((controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Paso',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un paso';
                    }
                    return null;
                  },
                ),
              );
            }).toList(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addStepField,
            ),

            SizedBox(height: 10),

            // Productos Asociados
            Text("Productos Asociados"),
            ..._productControllers.map((controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Producto Asociado',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un producto asociado';
                    }
                    return null;
                  },
                ),
              );
            }).toList(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addProductField,
            ),

            SizedBox(height: 10),
            TextField(
              controller: tiempoPreparacionController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Tiempo de Preparación (minutos)'),
            ),
            DropdownButtonFormField<String>(
              value: tipoGrano,
              items: ['Arábica', 'Robusta', 'Blend']
                  .map((grano) =>
                      DropdownMenuItem(value: grano, child: Text(grano)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  tipoGrano = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Tipo de Grano'),
            ),
            DropdownButtonFormField<String>(
              value: tipoCafetera,
              items: ['Espresso', 'French Press', 'Moka']
                  .map((cafetera) =>
                      DropdownMenuItem(value: cafetera, child: Text(cafetera)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  tipoCafetera = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Tipo de Cafetera'),
            ),
            SizedBox(height: 10),
            imagen != null
                ? Image.file(imagen!, height: 150)
                : Text("No se ha seleccionado ninguna imagen"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: tomarFoto,
                  icon: Icon(Icons.camera_alt),
                  label: Text('Tomar Foto'),
                ),
                ElevatedButton.icon(
                  onPressed: seleccionarImagen,
                  icon: Icon(Icons.photo),
                  label: Text('Galería'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: guardarReceta,
                child: Text("Guardar Receta"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> tomarFoto() async {
    // Intentar tomar una foto con la cámara
    final XFile? foto = await _picker.pickImage(source: ImageSource.camera);

    if (foto != null) {
      setState(() {
        imagen = File(foto.path); // Almacenar la imagen seleccionada
      });
    }
  }

  Future<void> seleccionarImagen() async {
    final XFile? imagenSeleccionada =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imagenSeleccionada != null) {
      setState(() {
        imagen = File(imagenSeleccionada.path);
      });
    }
  }
}

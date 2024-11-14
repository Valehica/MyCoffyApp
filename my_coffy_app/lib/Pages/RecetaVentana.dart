import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:my_coffy_app/models/paletaDeColores.dart';

class RecetaDetailScreen extends StatefulWidget {
  final Receta receta;

  const RecetaDetailScreen({Key? key, required this.receta}) : super(key: key);

  @override
  _RecetaDetailScreenState createState() => _RecetaDetailScreenState();
}

class _RecetaDetailScreenState extends State<RecetaDetailScreen> {
  late int vecesPreparada;
  late bool isFavorito;
  late bool isMy;
  late String imagePath; // Variable to store the local image path

  @override
  void initState() {
    super.initState();
    cargarRecetaJson();
    vecesPreparada = widget.receta.preparada ?? 0;
    isFavorito = widget.receta.favorita;
    isMy = widget.receta.esMia;
    imagePath =
        widget.receta.imagen; // Set the initial image path (URL or local)
  }

  void cargarRecetaJson() async {
    final file = File('path/to/receta.json');
    if (await file.exists()) {
      final data = await file.readAsString();
      final recetaData = json.decode(data);

      setState(() {
        widget.receta.favorita = recetaData['favorita'] ?? false;
        widget.receta.preparada = recetaData['preparada'] ?? false;
        widget.receta.valoracionPromedio =
            recetaData['valoracionPromedio'] ?? 0.0;
      });
    }
  }

  void actualizarRecetaJson() {
    widget.receta.favorita = isFavorito;
    widget.receta.preparada = vecesPreparada;
    guardarCambiosReceta(widget.receta);
  }

  void compartirReceta() {
    String recetaDetalles = '''
Título: ${widget.receta.titulo}
Ingredientes: ${widget.receta.ingredientes.join(", ")}
Pasos: ${widget.receta.pasos.join("\n")}
Tiempo de preparación: ${widget.receta.tiempoPreparacion} minutos
Calificación: ${widget.receta.valoracionPromedio} estrellas
''';
    Share.share(recetaDetalles);
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image from the camera or gallery
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagePath = image.path; // Store the local image path
        widget.receta.imagen = imagePath; // Update receta model
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receta.titulo),
        actions: [
          IconButton(
            icon: Icon(
              isFavorito ? Icons.favorite : Icons.favorite_border,
              color: isFavorito ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorito = !isFavorito;
                actualizarRecetaJson();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: compartirReceta,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg'),
                    ),
                    SizedBox(width: 8),
                    Text(
                      widget.receta.usuarioCreador,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            _buildImageCard(context),
            _buildDescriptionCard(context, 'Tiempo de preparación',
                widget.receta.tiempoPreparacion.toString(), 300),
            _buildDescriptionCard(context, 'Herramientas',
                widget.receta.productosAsociados.join(", "), 300),
            _buildDescriptionCard(context, 'Ingredientes',
                widget.receta.ingredientes.join(", "), 300),
            _buildDescriptionCard(
                context, 'Tipo de grano', widget.receta.tipoGrano, 300),
            _buildDescriptionCard(
                context, 'Tipo de cafetera', widget.receta.tipoCafetera, 300),
            _buildStepsCard(context, 'Pasos', widget.receta.pasos, 300),
            _buildRatingSection(context, widget.receta.valoracionPromedio),
            SizedBox(height: 20),
            _buildVecesPreparadaSection(),
            SizedBox(height: 20),
            if (isMy)
              ElevatedButton(
                onPressed: () {},
                child: Text("Modificar Receta"),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVecesPreparadaSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              setState(() {
                if (vecesPreparada > 0) vecesPreparada--;
                actualizarRecetaJson();
              });
            },
          ),
          Text(
            'Veces preparada: $vecesPreparada',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              setState(() {
                vecesPreparada++;
                actualizarRecetaJson();
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> guardarCambiosReceta(Receta recetaModificada) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/recetas.json');

      String contenido = await file.readAsString();
      List<dynamic> recetasJson = [];

      if (contenido.isNotEmpty) {
        recetasJson = json.decode(contenido);
      }

      bool recetaActualizada = false;
      for (int i = 0; i < recetasJson.length; i++) {
        if (recetasJson[i]['titulo'] == recetaModificada.titulo) {
          recetasJson[i] = recetaModificada.toJson();
          recetaActualizada = true;
          break;
        }
      }

      if (!recetaActualizada) {
        recetasJson.add(recetaModificada.toJson());
      }

      await file.writeAsString(json.encode(recetasJson));
      print("Receta guardada exitosamente.");
    } catch (e) {
      print("Error al guardar la receta: $e");
    }
  }

  Widget _buildDescriptionCard(
      BuildContext context, String title, String content, double alto) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.negrio,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    color: AppColors.negrio,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepsCard(
      BuildContext context, String title, List<String> steps, double alto) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.negrio,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                for (var step in steps)
                  Text(
                    step,
                    style:
                        const TextStyle(color: AppColors.negrio, fontSize: 13),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection(BuildContext context, double valoracion) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Calificación:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RatingBar.builder(
            initialRating: valoracion,
            minRating: 1,
            itemSize: 25,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: AppColors.medio,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                widget.receta.valoracionPromedio = rating;
                actualizarRecetaJson();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: imagePath.startsWith('http') // Check if it's a URL
                ? Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(imagePath), // If it's local, load it from the file
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}

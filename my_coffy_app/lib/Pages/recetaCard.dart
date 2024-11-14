import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/RecetaVentana.dart';
import 'package:my_coffy_app/models/paletaDeColores.dart';
import 'package:my_coffy_app/models/receta_class.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class RecetaCard extends StatefulWidget {
  final Receta receta;

  const RecetaCard({super.key, required this.receta});

  @override
  _RecetaCardState createState() => _RecetaCardState();
}

class _RecetaCardState extends State<RecetaCard> {
  late CameraController _cameraController; // Controlador de la cámara
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Iniciar la cámara solo si se va a usar (puedes ajustarlo para tomar la foto si es necesario)
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Obtén la lista de cámaras disponibles
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    // Crear el controlador para la cámara
    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);

    // Inicializar el controlador
    _initializeControllerFuture = _cameraController.initialize();
  }

  // Método para capturar una foto
  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();
      setState(() {
        widget.receta.imagen =
            image.path; // Guardamos la foto capturada en la receta
      });
    } catch (e) {
      print('Error al tomar la foto: $e');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose(); // Liberar el controlador cuando ya no se use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Si se presiona
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecetaDetailScreen(receta: widget.receta)),
        );
      },
      child: SizedBox(
        width: 300, // Ajusta el ancho según tus necesidades
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Control de la imagen
              widget.receta.imagen.startsWith('http')
                  ? ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        widget.receta.imagen,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    )
                  : ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: widget.receta.imagen.isNotEmpty
                          ? Image.file(
                              File(widget.receta.imagen),
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            )
                          : Container(
                              color: AppColors.plata,
                              height: 200,
                              width: double.infinity,
                              child: IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: _takePicture,
                              ),
                            ),
                    ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Control de título
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.receta.titulo,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Control si es o no favorito
                        IconButton(
                          icon: Icon(
                            widget.receta.favorita
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: widget.receta.favorita ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.receta.favorita = !widget.receta.favorita;
                            });
                          },
                        ),
                      ],
                    ),
                    // Control del tiempo de preparación
                    Text(
                      'Tiempo de preparación: ${widget.receta.tiempoPreparacion}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    // Control calificación con estrellas
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            index < widget.receta.valoracionPromedio.round()
                                ? Icons.star
                                : Icons.star_border,
                            color: AppColors.medio,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.receta.valoracionPromedio.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

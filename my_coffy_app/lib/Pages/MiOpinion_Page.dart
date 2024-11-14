import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para leer el archivo JSON
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MiOpinion extends StatefulWidget {
  @override
  _MiOpinion createState() => _MiOpinion();
}

class _MiOpinion extends State<MiOpinion> {
  List<dynamic> preguntas = [];
  Map<String, dynamic> respuestas =
      {}; // Almacena las respuestas de las preguntas
  TextEditingController _identificacionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarPreguntas();
  }

  // Cargar preguntas desde el archivo JSON
  Future<void> cargarPreguntas() async {
    final String response =
        await rootBundle.loadString('assets/preguntas.json');
    final data = json.decode(response);
    setState(() {
      preguntas = data;
    });
  }

  // Enviar retroalimentación por correo electrónico
  Future<void> enviarRetroalimentacion() async {
    final String usuario = _identificacionController.text;
    final String respuestasTexto =
        respuestas.entries.map((e) => '${e.key}: ${e.value}').join('\n');

    final Email email = Email(
      body: 'Usuario: $usuario\n\n$respuestasTexto',
      subject: 'Retroalimentación de la Aplicación',
      recipients: [
        'valehica@gmail.com'
      ], // Cambia esto con el correo del desarrollador
      isHTML: false,
    );

    try {
      // Intentar enviar el correo
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('¡Gracias por tu retroalimentación!'),
      ));
    } catch (error) {
      // Error al enviar el correo
      if (error.toString().contains("not_available")) {
        // Si el error es relacionado a no tener un cliente de correo
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('No se encontró un cliente de correo en este dispositivo.'),
        ));
      } else {
        // Otro tipo de error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hubo un error al enviar la retroalimentación.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Opinión'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Por favor, dinos tu opinión.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _identificacionController,
              decoration: InputDecoration(
                labelText: 'Tu identificación',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Mostrar las preguntas dinámicamente
            ...preguntas.map((pregunta) {
              if (pregunta['tipo'] == 'rating') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      pregunta['pregunta'],
                      style: TextStyle(fontSize: 16),
                    ),
                    Slider(
                      min: 1,
                      max: 5,
                      value: respuestas[pregunta['pregunta']] ?? 3,
                      divisions: 4,
                      label: (respuestas[pregunta['pregunta']] ?? 3)
                          .round()
                          .toString(),
                      onChanged: (value) {
                        setState(() {
                          respuestas[pregunta['pregunta']] = value;
                        });
                      },
                    ),
                  ],
                );
              } else if (pregunta['tipo'] == 'text') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      pregunta['pregunta'],
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          respuestas[pregunta['pregunta']] = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escribe tu respuesta...',
                      ),
                    ),
                  ],
                );
              } else {
                return Container(); // En caso de que no haya un tipo válido
              }
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: enviarRetroalimentacion,
              child: Text('Enviar Retroalimentación'),
            ),
          ],
        ),
      ),
    );
  }
}

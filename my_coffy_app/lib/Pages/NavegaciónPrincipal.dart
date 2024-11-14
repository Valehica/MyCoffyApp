/*
Ventan principal, en esta clase se maneja el desplazamiento de ventanas dentro de la aplicacion 
para esto se utilizo un Botton navigation (recurso dentro de flutter)

Paginas: 
  - Home
  - Mi barista
  - Mis Recetas 
  - Mi Opinion
  - Mi perfil 
*/

import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/chat.dart';

import 'package:my_coffy_app/Pages/HomePage.dart';
import 'package:my_coffy_app/Pages/MiBarista_Page.dart';
import 'package:my_coffy_app/Pages/MiOpinion_Page.dart';
import 'package:my_coffy_app/Pages/MiRecetas_Page.dart';
import 'package:my_coffy_app/Pages/Usuario.dart';
import 'package:my_coffy_app/models/paletaDeColores.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _currentIndex = 0;

  // Definir las páginas para cada pestaña
  final List<Widget> _pages = [
    Center(child: Home()),
    Center(child: MiBarista()),
    Center(child: MisRecetasScreen()),
    Center(child: MiOpinion()),
    const Center(child: UserProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        //buscador
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          title: Container(
            decoration: BoxDecoration(
              color: AppColors.plata,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          //chat
          actions: [
            IconButton(
              icon: const Icon(Icons.chat, color: AppColors.medio),
              onPressed: () {
                //se presiono el boton
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
              },
            ),
          ],
        ),

        body: _pages[_currentIndex], // Actualizar la pagina
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          //parte visual (iconos y titulos de cada apartado)
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'MiBarista',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'MisRecetas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Opinion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuario',
            ),
          ],

          //Personalización de colores:
          selectedItemColor: AppColors.oscuro, //Item seleccionado
          unselectedItemColor: AppColors.medio, //Items no seleccionados
          type: BottomNavigationBarType.fixed,

          // Personalización de tamaños:
          iconSize: 30.0, // Tamaño de los íconos
          selectedFontSize: 16.0, // Tamaño del texto seleccionado
          unselectedFontSize: 14.0,
        ),
      ),
    );
  }
}

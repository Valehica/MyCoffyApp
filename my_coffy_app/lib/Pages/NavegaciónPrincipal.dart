/*
Ventan principal, en esta clase se maneja el desplazamiento de ventanas dentro de la aplicacion 
para esto se utilizo un Botton navigation (recurso dentro de flutter)
*/

import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/HomeTabBar.dart';
import 'package:my_coffy_app/Pages/Categorias.dart';
import 'package:my_coffy_app/Pages/Usuario.dart';
import 'package:my_coffy_app/createReceta.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _currentIndex = 0;

  // Definir las páginas para cada pestaña
  final List<Widget> _pages = [
    const Center(child: CategoriesScreen()),
    const Center(child: HomeTabBar('home')),
    const Center(child: CreateRecetaScreen()),
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
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          //chat
          actions: [
            IconButton(
              icon: Icon(Icons.chat,
                  color: const Color.fromARGB(255, 93, 64, 55)),
              onPressed: () {
                //se presiono el boton
                print('Chat button pressed');
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
              icon: Icon(Icons.list),
              label: 'Categorías',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Agregar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuario',
            ),
          ],

          //Personalización de colores:
          selectedItemColor:
              const Color.fromARGB(255, 93, 64, 55), //Item seleccionado
          unselectedItemColor:
              const Color.fromARGB(255, 161, 136, 127), //Items no seleccionados
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

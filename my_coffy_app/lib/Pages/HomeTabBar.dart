/*
Clase para manejar el movimiento dentro de la pagina de home (ya que en esta hay dos paginas msa: tu feed y explorar)
para esto se utilizo un tab bar 
*/

import 'package:flutter/material.dart';
import 'package:my_coffy_app/Pages/FeedHome.dart';
import 'package:my_coffy_app/Pages/ExplorarHome.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        TabBar(
          controller: _tabController,
          // ajustra altura y tamaño del texto (pestañas de arriba)
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
          indicatorWeight: 4.0,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          tabs: const <Widget>[
            Tab(text: 'Tu Feed'),
            Tab(text: 'Descubrir'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                child: Center(child: FeedHomeScreen()),
              ),
              Card(
                child: Center(child: ExplorarHomeScreen()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

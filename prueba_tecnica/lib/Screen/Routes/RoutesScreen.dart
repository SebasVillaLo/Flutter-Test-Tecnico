import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Screen/Home/HomePage.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myRoutes = [
      const HomePage(),
    ];
    return myRoutes[index];
  }
}

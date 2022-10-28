import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // iconSize: 18.5,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/Icon/casa.png'),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Icon/shop.png'),
          label: 'Tienda',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Icon/mensajes.png'),
          label: 'Mensajes',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Icon/persona.png'),
          label: 'Perfil',
        ),
      ],
      currentIndex: index,
      selectedItemColor: Colors.amber[800],
      onTap: (int i) {
        setState(() {
          index = i;
        });
      },
    );
  }
}

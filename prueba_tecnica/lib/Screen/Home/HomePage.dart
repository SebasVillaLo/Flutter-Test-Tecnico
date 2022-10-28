import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prueba_tecnica/Components/CardCategories.dart';
import 'package:prueba_tecnica/Components/NavBar/Navbar.dart';
import 'package:prueba_tecnica/Components/TabBar/TabBar.dart';
import 'package:prueba_tecnica/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 242, 242, 242),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(273.2),
        child: AppBar(
          toolbarHeight: 70,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    width: 325,
                    height: 100,
                  ),
                  Container(
                    width: 305,
                    height: 143,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Image/offert.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.amber,
                child: Image.asset(
                  'assets/Image/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Image.asset('assets/Logo/LogoWhite.png', fit: BoxFit.cover),
          backgroundColor: Colors.black,
          leading: Image.asset('assets/Icon/menu.png'),
          elevation: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.8, left: 34.5),
            child: Text(
              'Categorias',
              style: kTitlePrimary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 34.5),
            child: Text(
              'Selecciona una categoria',
              style: kSubtitleHome,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 15.81,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardCategories(
                    image: 'assets/Icon/escabadora.png',
                    title: 'Maquinas',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Tabbar(
                            initialTab: 0,
                          ),
                        ),
                      );
                    },
                  ),
                  CardCategories(
                    image: 'assets/Icon/camion.png',
                    title: 'Transportadores',
                    widthImage: 117,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Tabbar(
                            initialTab: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardCategories(
                    image: 'assets/Icon/herramienta.png',
                    title: 'Repuestos',
                    onTap: () {},
                  ),
                  CardCategories(
                    image: 'assets/Icon/constructor.png',
                    title: 'Operadores',
                    onTap: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
      // create a navigatio bar at the bottom of the screen with 4 icons
      bottomNavigationBar: const NavBar(),
    );
  }
}

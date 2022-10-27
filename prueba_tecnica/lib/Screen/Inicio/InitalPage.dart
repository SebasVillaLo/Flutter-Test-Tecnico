import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Screen/Buscador/BuscadorPage.dart';
import 'package:prueba_tecnica/constants.dart';

var id = 0;
var hover = Colors.transparent;
var hover2 = Colors.transparent;

class InitialPage extends StatefulWidget {
  const InitialPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/Logo/Logov2.png', fit: BoxFit.cover),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Image/Background.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 8),
              child: Text('Bienvenido a Equipesados', style: kTitlePrimary),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 15),
              child: Text('¿Qué deseas hacer?', style: kTitleSecondary),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (id == 2) {
                        hover2 = Colors.transparent;
                      }
                      id = 1;
                      hover = Colors.orange;
                    });
                  },
                  child: Container(
                    width: 146,
                    height: 152,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: hover,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9.5),
                          child: Image.asset('assets/Icon/cart.png',
                              width: 58, height: 58),
                        ),
                        const Text('Quiero buscar', style: kSubtitle),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  // add function when selected change border color
                  onTap: () {
                    setState(() {
                      if (id == 1) {
                        hover = Colors.transparent;
                      }
                      id = 2;
                      hover2 = Colors.orange;
                    });
                  },
                  child: Container(
                    width: 146,
                    height: 152,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: hover2,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9.5),
                          child: Image.asset(
                            'assets/Icon/publicar.png',
                            width: 58,
                            height: 58,
                          ),
                        ),
                        const Text('Quiero publicar', style: kSubtitle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // add orange button at the bottom to fit on all screens
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (id == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const BuscadorPage()),
                      );
                    } else if (id == 2) {
                      null;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor selecciona una opción'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 380,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Continuar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

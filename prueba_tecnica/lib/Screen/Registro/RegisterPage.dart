import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Backend/FireBase/AddUser.dart';
import 'package:prueba_tecnica/Components/Input.dart';
import 'package:prueba_tecnica/Screen/Home/HomePage.dart';
import 'package:prueba_tecnica/constants.dart';
import 'package:prueba_tecnica/Backend/FireBase/FirebaseConection.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final nombreCompleto = TextEditingController();
  final email = TextEditingController();
  final telefono = TextEditingController();
  final identificacion = TextEditingController();
  final direccion = TextEditingController();
  Color? nameColor, emailColor, phoneColor, idColor, addressColor;
  AnimationController? animationController;
  Animation<double>? animation;
  String dropDownCurrentValueD = 'Seleccionar';
  String dropDownCurrentValueC = 'Seleccionar';

  @override
  void initState() {
    super.initState();
    nameColor = Colors.transparent;
    emailColor = Colors.transparent;
    phoneColor = Colors.transparent;
    idColor = Colors.transparent;
    addressColor = Colors.transparent;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: Colors.black,
          icon: Image.asset(
            'assets/Icon/flechaIzquierda.png',
            fit: BoxFit.cover,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset('assets/Logo/Logov2.png', fit: BoxFit.cover),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 8),
              child: Text('Registro', style: kTitlePrimary),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 15),
              child: Text('Datos personales', style: kTitleSecondary),
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Nombre completo', style: kText),
                ),
                InputRegister(
                  myController: nombreCompleto,
                  hintText: 'Nombre completo',
                  inputType: TextInputType.name,
                  actionText: TextInputAction.next,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 18),
                  child: Text('Email', style: kText),
                ),
                InputRegister(
                  myController: email,
                  hintText: 'ejemplo@gmail.com',
                  inputType: TextInputType.emailAddress,
                  actionText: TextInputAction.next,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 18),
                  child: Text('Telefono', style: kText),
                ),
                InputRegister(
                  myController: telefono,
                  hintText: '000 0000 000',
                  inputType: TextInputType.phone,
                  actionText: TextInputAction.next,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 18),
                  child: Text('Identificación', style: kText),
                ),
                InputRegister(
                  myController: identificacion,
                  hintText: '00000000000',
                  inputType: TextInputType.number,
                  actionText: TextInputAction.next,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 18),
                  child: Text('Departamento', style: kText),
                ),
                // Create DropdownButton Custom
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 4),
                  child: Container(
                    width: 316,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.black45, width: 1),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          style: kDropDownStyleText,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 30,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownCurrentValueD = newValue!;
                            });
                          },
                          isExpanded: true,
                          value: dropDownCurrentValueD,
                          // add all departaments from colombia the list
                          items: const [
                            'Seleccionar',
                            'Antioquia',
                            'Cundinamarca',
                            'Bogotá',
                            'Valle del Cauca',
                            'Cauca',
                            'Cesar',
                            'Chocó',
                            'Córdoba',
                            'Guaviare',
                            'Huila',
                            'La Guajira',
                            'Magdalena',
                            'Meta',
                            'Nariño',
                            'Norte de Santander',
                            'Putumayo',
                            'Quindío',
                            'Risaralda',
                            'San Andrés y Providencia',
                            'Santander',
                            'Sucre',
                            'Tolima',
                            'Arauca',
                            'Boyacá',
                            'Caldas',
                            'Caquetá',
                            'Casanare',
                            'Casanare',
                            'Guainía',
                            'Guaviare',
                            'Vaupés',
                            'Vichada'
                          ].map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                // Create another dropdown of cities in Colombia and depending on the value of the previous dropdown show different elements.
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 18),
                  child: Text('Ciudad', style: kText),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 4),
                  child: Container(
                    width: 316,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.black45, width: 1),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          style: kDropDownStyleText,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 30,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownCurrentValueC = newValue!;
                            });
                          },
                          // isExpanded: true,
                          value: dropDownCurrentValueC,
                          // add all cities from colombia the list
                          items: const [
                            'Seleccionar',
                            'Medellín',
                            'Bogotá',
                            'Cali',
                            'Barranquilla',
                            'Cartagena',
                            'Cúcuta',
                            'Ibagué',
                            'Bucaramanga',
                            'Pereira',
                            'Santa Marta',
                            'Manizales',
                            'Villavicencio',
                            'Pasto',
                            'Neiva',
                            'Armenia',
                            'Soledad',
                            'Montería',
                            'Sincelejo',
                            'Valledupar',
                            'Popayán',
                            'Floridablanca',
                            'Bello',
                            'Soacha',
                            'Buenaventura',
                            'Itagüí',
                            'Girardot',
                            'Envigado',
                            'Dosquebradas',
                            'Cúcuta',
                            'Soacha',
                            'Buenaventura',
                            'Itagüí',
                            'Girardot',
                            'Envigado',
                            'Dosquebradas',
                            'Cúcuta',
                            'Soacha',
                            'Buenaventura',
                            'Itagüí',
                            'Girardot',
                            'Envigado',
                            'Dosquebradas',
                            'Cúcuta',
                            'Soacha',
                            'Buenaventura',
                            'Itagüí',
                            'Girardot',
                            'Envigado',
                          ].map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 18),
                  child: Text('Dirección', style: kText),
                ),
                InputRegister(
                  myController: direccion,
                  hintText: 'Calle 00 # 00 - 00',
                  inputType: TextInputType.streetAddress,
                  actionText: TextInputAction.send,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
        child: GestureDetector(
          onTap: () async {
            if (nombreCompleto.text.isEmpty ||
                email.text.isEmpty ||
                telefono.text.isEmpty ||
                direccion.text.isEmpty ||
                dropDownCurrentValueC == 'Seleccionar' ||
                dropDownCurrentValueD == 'Seleccionar') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Por favor, rellene todos los campos'),
                ),
              );
            } else {
              try {
                // add new user to firebase using the function addUser
                if (await FirebaseConection.addUser(
                  nombreCompleto.text,
                  email.text,
                  direccion.text,
                  telefono.hashCode,
                  identificacion.hashCode,
                  dropDownCurrentValueD,
                  dropDownCurrentValueC,
                )) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al crear el usuario'),
                    ),
                  );
                }
              } catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Error al crear el usuario, intentelo mas tarde'),
                  ),
                );
              }
            }

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
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
                'Siguiente',
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
    );
  }
}

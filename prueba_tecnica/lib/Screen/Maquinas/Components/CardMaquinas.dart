import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Screen/Maquinas/detalles/DetallesMaquina.dart';

class CardMaquinas extends StatelessWidget {
  final bool venta;
  final bool? alquiler;
  final String ciudad;
  final Map data;
  const CardMaquinas({
    Key? key,
    required this.venta,
    required this.alquiler,
    required this.ciudad,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget checkV = venta == true
        ? Image.asset(
            'assets/Icon/check.png',
            width: 16,
            height: 16,
          )
        : const Icon(
            Icons.close,
            color: Colors.red,
            size: 16,
          );
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetallesMaquina(
                data: data,
              ),
            ),
          );
        },
        child: Container(
          width: 350,
          height: 200,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Container(
                  width: 285,
                  height: 111,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 75,
                          height: 20,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                            ),
                            color: Color(0xFFE53F0C),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 6, right: 6),
                            child: Text(
                              'Max. 2,65 tn',
                              style: TextStyle(
                                  fontFamily: 'Barlow',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 50,
                        child: Container(
                          width: 120,
                          height: 16,
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/Icon/point.png',
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                              const SizedBox(width: 5.67),
                              Text(
                                '${ciudad}',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Barlow'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 30,
                        child: Container(
                          width: 200,
                          child: Text(
                            'Some long tk-456 name for a excavator example name',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Barlow'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 50,
                        child: Container(
                          width: 57,
                          height: 23,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFC4C4C4),
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              checkV,
                              const SizedBox(width: 3.25),
                              const Text(
                                'Venta',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Barlow'),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 10, left: 6),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 88,
                    height: 91,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(data['image'][0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

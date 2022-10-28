import 'package:flutter/material.dart';

class Filtro extends StatelessWidget {
  const Filtro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 28.38, right: 26, bottom: 14.62),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '30 resultados',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Barlow'),
            ),
            Container(
              width: 60,
              height: 22,
              child: Row(
                children: [
                  const Text(
                    'Filtrar',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Barlow'),
                  ),
                  const SizedBox(width: 3),
                  Container(
                    child: Image.asset('assets/Icon/filtro.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
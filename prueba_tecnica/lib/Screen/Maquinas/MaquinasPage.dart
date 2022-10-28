import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Backend/FireBase/datosMaquinas.dart';
import 'package:prueba_tecnica/Screen/Maquinas/Components/Lista.dart';
import 'package:prueba_tecnica/constants.dart';

import 'Components/Buscador.dart';
import 'Components/Filtro.dart';

List data = [];
late Map allData = {};

class MaquinaPage extends StatefulWidget {
  const MaquinaPage({super.key});

  @override
  State<MaquinaPage> createState() => _MaquinaPageState();
}

class _MaquinaPageState extends State<MaquinaPage> {
  final TextEditingController search = TextEditingController();
  bool loading = true;

  Future<List> tomarDatos() async {
    data = await MaquinaDatos.getMaquinas();
    return data;
  }

  @override
  void initState() {
    super.initState();
    tomarDatos().then((value) {
      setState(() {
        data.add(value);
        if (data.isNotEmpty) {
          allData = data.asMap();
          loading = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            color: kBackGroundColorSecundary,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Buscador(search: search),
                  const SizedBox(height: 12.38),
                  const Filtro(),
                  ListaMaquinas(data: allData),
                ],
              ),
            ),
          );
  }
}

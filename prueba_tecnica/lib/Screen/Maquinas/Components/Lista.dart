import 'package:flutter/material.dart';

import 'CardMaquinas.dart';

class ListaMaquinas extends StatefulWidget {
  final Map data;
  const ListaMaquinas({super.key, required this.data});

  @override
  State<ListaMaquinas> createState() => _ListaMaquinasState();
}

class _ListaMaquinasState extends State<ListaMaquinas> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CardMaquinas(
          venta: widget.data[index]['venta'],
          alquiler: widget.data[index]['alquiler'],
          ciudad: widget.data[index]['city'],
          data: widget.data[index],
        );
      },
    );
  }
}

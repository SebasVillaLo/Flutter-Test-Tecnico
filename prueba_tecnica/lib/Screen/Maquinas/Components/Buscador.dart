import 'package:flutter/material.dart';
import 'package:prueba_tecnica/constants.dart';

class Buscador extends StatelessWidget {
  const Buscador({
    Key? key,
    required this.search,
  }) : super(key: key);

  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266,
      height: 30,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        autocorrect: true,
        controller: search,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFFC4C4C4),
            size: 15.58,
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Buscar',
          hintStyle: kHintStyleText,
          contentPadding:
              EdgeInsets.only(left: 13, top: 5, bottom: 5, right: 13),
        ),
      ),
    );
  }
}

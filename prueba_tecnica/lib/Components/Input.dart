import 'package:flutter/material.dart';

class InputRegister extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction actionText;
  const InputRegister(
      {Key? key,
      required this.myController,
      required this.hintText,
      required this.inputType,
      required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 4),
      child: Container(
        width: 316,
        height: 44,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromARGB(242, 242, 242, 242),
        ),
        child: TextField(
          keyboardType: inputType,
          autocorrect: true,
          controller: myController,
          textInputAction: actionText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hintText,
            contentPadding: const EdgeInsets.only(left: 10),
          ),
        ),
      ),
    );
  }
}

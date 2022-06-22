import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    Key? key,
    this.controller,
    this.hintext,
    this.labelText,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintext;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 400,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 235, 235, 235),
              ),
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 238, 238, 238),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.start,
              autocorrect: true,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintext,
                labelText: labelText,
                labelStyle: const TextStyle(),
                hintStyle: const TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

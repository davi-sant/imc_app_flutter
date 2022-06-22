import 'package:flutter/material.dart';
import 'package:imc_app_flutter/components/text_button_componet.dart';
import 'package:imc_app_flutter/components/text_field_component.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    Key? key,
    this.controllerAltura,
    this.controllerPeso,
    this.hintexAltura,
    this.hintextPeso,
    this.iconButton,
    required this.toggleIcon,
    this.text,
    this.colorTextButton,
    this.fontSizeTextBtton,
    required this.press,
  }) : super(key: key);
  final TextEditingController? controllerAltura;
  final TextEditingController? controllerPeso;
  final String? hintexAltura;
  final String? hintextPeso;
  final dynamic iconButton;
  final bool toggleIcon;
  final String? text;
  final Color? colorTextButton;
  final double? fontSizeTextBtton;
  final VoidCallback press;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldComponent(
              controller: widget.controllerAltura,
              hintext: widget.hintexAltura,
            ),
            const SizedBox(height: 10),
            TextFieldComponent(
              controller: widget.controllerPeso,
              hintext: widget.hintextPeso,
            ),
            const SizedBox(height: 20),
            TextButtonComponet(
              press: widget.press,
              aceptIcon: widget.toggleIcon,
              icon: widget.iconButton,
              text: widget.text ?? "",
              colorText: widget.colorTextButton,
              fontSize: widget.fontSizeTextBtton,
            )
          ],
        ),
      ),
    );
  }
}

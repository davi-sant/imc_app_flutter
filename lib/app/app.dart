import 'package:flutter/material.dart';
import 'package:imc_app_flutter/utils/texts_controller.dart';
import 'package:imc_app_flutter/widgets/form_widget.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saude Vida'),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: FormWidget(
            hintexAltura: "Altura (cm)",
            hintextPeso: "Peso (kg)",
            controllerAltura: TextsController.altura,
            controllerPeso: TextsController.peso,
          ),
        ),
      ),
    );
  }
}

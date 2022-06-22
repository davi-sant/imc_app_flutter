import 'package:flutter/material.dart';
import 'package:imc_app_flutter/utils/texts_controller.dart';
import 'package:imc_app_flutter/widgets/form_widget.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? msg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Saude Vida'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child:
                    const Icon(Icons.person, size: 150, color: Colors.orange)),
            Container(
              decoration: const BoxDecoration(),
              child: Center(
                child: FormWidget(
                  hintexAltura: "Altura (cm)",
                  hintextPeso: "Peso (kg)",
                  controllerAltura: TextsController.altura,
                  controllerPeso: TextsController.peso,
                  toggleIcon: false,
                  iconButton: const Icon(Icons.wrap_text_sharp),
                  text: 'Calcular IMC',
                  colorTextButton: Colors.black,
                  fontSizeTextBtton: 14,
                  press: () {
                    String altura = TextsController.altura.text;
                    String peso = TextsController.peso.text;

                    setState(() {
                      altura.isEmpty & peso.isEmpty
                          ? print(msg = "Por favor preencha todos os campos")
                          : isNumeric(altura) & isNumeric(peso) == false
                              ? print(msg = "Por favor digite um numero")
                              : msg = _calcImc().toString();
                      _resettext();
                    });
                  },
                ),
              ),
            ),
            Text(msg ?? "info"),
          ],
        ),
      ),
    );
  }

  RegExp _numeric = RegExp(r'^-?[0-9]+$');

  RegExp _alpha = RegExp(r'^[a-zA-Z]+$');

  _resettext() {
    TextsController.altura.text = "";
    TextsController.peso.text = "";
    String isEmptyText = "Por favor preencha todos os campos";
  }

  _calcImc() {
    String altura = TextsController.altura.text;
    String peso = TextsController.peso.text;
    double calc = double.parse(altura) + double.parse(peso);
    return calc;
  }

  bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }
}

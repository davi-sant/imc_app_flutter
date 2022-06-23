import 'package:flutter/material.dart';
import 'package:imc_app_flutter/utils/message_validation.dart';
import 'package:imc_app_flutter/utils/regex_validation.dart';
import 'package:imc_app_flutter/utils/texts_controller.dart';
import 'package:imc_app_flutter/widgets/form_widget.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? msg = MessageValidation.msgField;

  @override
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
                    _validateField();
                    _resettext();
                  },
                ),
              ),
            ),
            Text(
              msg ?? "info",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  _resettext() {
    TextsController.altura.text = "";
    TextsController.peso.text = "";
  }

  _validateField() {
    String altura = TextsController.altura.text;
    String peso = TextsController.peso.text;
    String replaceAltura =
        TextsController.altura.text.replaceAll(",", "").replaceAll(".", "");
    String replacePeso =
        TextsController.peso.text.replaceAll(",", "").replaceAll(".", "");

    setState(() {
      if (altura.isEmpty && peso.isEmpty) {
        msg = "Por favor preencha todos os campos !!";
      } else if (isNumeric(replaceAltura) & isNumeric(replacePeso) == false) {
        msg =
            "Atenção!! Os valores  indicados não correspondem há um tipo numerico por favor preencha corretamente";
        return;
      } else {
        msg = _calcImc().toString();
        return;
      }
    });
  }

  _calcImc() {
    String replaceAltura = TextsController.altura.text.replaceAll(",", ".");
    String replacePeso = TextsController.peso.text.replaceAll(",", ".");
    num alturaToDouble = num.parse(replaceAltura);
    num pesoToDouble = num.parse(replacePeso);
    num baseCalc = pesoToDouble / (alturaToDouble * alturaToDouble);

    setState(() {
      if (baseCalc <= 18.5) {
        msg =
            "Atenção!! seu IMC ${(baseCalc.toStringAsPrecision(3))} está abaixo da media recomendada - MAGREZA - (0)";
      } else if (baseCalc >= 18.5 && baseCalc < 24.9) {
        msg =
            "Atenção!! seu IMC - ${baseCalc.toStringAsPrecision(3)} está na media recomendada - NORMAL";
      } else if (baseCalc >= 25.0 && baseCalc < 29.9) {
        msg =
            "Atenção!! seu IMC - ${baseCalc.toStringAsPrecision(3)} está acima da media recomendada - OBSIDADE - (I)";
      } else if (baseCalc >= 30.0 && baseCalc < 39.9) {
        msg =
            "Atenção!! seu IMC - ${baseCalc.toStringAsPrecision(3)} está acima da media recomendada - OBSIDADE - (II)";
      } else if (baseCalc > 39.9) {
        msg =
            "Atenção!! seu IMC - ${baseCalc.toStringAsPrecision(3)} está acima da media recomendada - OBSIDADE - (III)";
      }
    });
    String result = msg!;
    return result;
  }

  bool isNumeric(String str) {
    return RegexValidation.float.hasMatch(str);
  }
}

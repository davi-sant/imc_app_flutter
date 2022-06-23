import 'package:imc_app_flutter/utils/texts_controller.dart';

class RegexValidation {
  static RegExp numeric = RegExp(r'^-?[0-9]+$');
  static RegExp float =
      RegExp(r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$');

  static String altura =
      TextsController.altura.text.replaceAll(",", "").replaceAll(".", "");
  static String peso =
      TextsController.peso.text.replaceAll(",", "").replaceAll(".", "");
}

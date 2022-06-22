import 'package:flutter/material.dart';

class TextButtonComponet extends StatelessWidget {
  const TextButtonComponet(
      {Key? key,
      required this.press,
      required this.icon,
      required this.aceptIcon,
      this.text,
      this.alignment,
      this.colorText,
      this.fontSize})
      : super(key: key);
  final VoidCallback press;
  final bool aceptIcon;
  final dynamic icon;
  final String? text;
  final dynamic alignment;
  final Color? colorText;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Container(
          width: double.infinity,
          height: 45,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8),
          ),
          child: aceptIcon == true
              ? Row(
                  mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                  children: [
                    icon,
                    const SizedBox(width: 10),
                    Text(
                      text ?? "",
                      textAlign: alignment,
                      style: TextStyle(
                        color: colorText,
                        fontSize: fontSize ?? 14,
                      ),
                    )
                  ],
                )
              : Text(
                  text ?? "",
                  textAlign: alignment ?? TextAlign.center,
                  style: TextStyle(
                    color: colorText,
                    fontSize: fontSize ?? 14,
                  ),
                ),
        ));
  }
}

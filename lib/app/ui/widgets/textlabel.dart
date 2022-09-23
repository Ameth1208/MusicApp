import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';

class TextApp extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const TextApp({
    super.key,
    this.text = "",
    this.color = ColorApp.textColor,
    this.fontSize = sizeTextT1,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  const TextApp.title1({
    super.key,
    this.text = "",
    this.color = ColorApp.textColor,
    this.fontSize = sizeTextT2,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  const TextApp.title2({
    super.key,
    this.text = "",
    this.color = ColorApp.textColor,
    this.fontSize = sizeTextT3,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  const TextApp.title3({
    super.key,
    this.text = "",
    this.color = ColorApp.textColor,
    this.fontSize = sizeTextT4,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: color,
        fontSize: context.dp(fontSize),
        fontWeight: fontWeight,
      ),
    );
  }
}

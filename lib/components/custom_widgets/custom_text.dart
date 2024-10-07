import 'package:flutter/material.dart';

import '../constants/font_family.dart';

class CustomText extends StatelessWidget {
  final Color? color;
  final double? fontSize;
  final int? maxLine;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final String text;
  final String? fontFamily;
  final double? lineHeight;
  final TextOverflow? overflow;
  final double? letterSpacing;

  const CustomText(this.text,
      {super.key,
      this.overflow,
      this.color,
      this.decoration = TextDecoration.none,
      this.fontSize = 12,
      this.fontStyle,
      this.fontWeight = FontWeight.normal,
      this.maxLine,
      this.textAlign,
      this.fontFamily,
      this.lineHeight,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
        color: color,
        height: lineHeight,
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        fontFamily: fontFamily ?? FontFamily.inter,
      ),
    );
  }
}

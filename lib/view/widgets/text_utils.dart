import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underLine;
  final TextAlign textAlign;

  const TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.underLine,
    required this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            decoration: underLine,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        textAlign: textAlign,
      ),
    );
  }
}

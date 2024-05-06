import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key,
      required this.text,
      required this.size,
      this.color = Colors.white});
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            fontSize: size, color: color, fontWeight: FontWeight.bold));
  }
}

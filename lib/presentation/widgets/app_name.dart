import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CuidArteText extends StatelessWidget {
  final double fontSize;
  final Color? color;

  const CuidArteText({super.key, this.fontSize = 32, this.color});

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? const Color(0xFF9879A2);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Cuid',
            style: GoogleFonts.manrope(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          TextSpan(
            text: 'Arte',
            style: GoogleFonts.dancingScript(
              fontSize: fontSize + 2,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

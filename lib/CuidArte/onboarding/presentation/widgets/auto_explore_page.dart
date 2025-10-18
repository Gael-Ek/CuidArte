import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AutoexplorePage extends StatelessWidget {
  const AutoexplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/mujer.json',
              height: 200,
              backgroundLoading: true,
            ),
            const SizedBox(height: 24),
            Text(
              'Aprende a conocerte',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'En la sección ',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                children: [
                  TextSpan(
                    text: 'Aprende a ',
                    style: TextStyle(fontSize: 16, color: Colors.pink[200]),
                  ),
                  TextSpan(
                    text: 'CuidArte',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9879A2),
                    ),
                  ),
                  TextSpan(
                    text:
                        ', encontrarás pasos e ilustraciones sobre cómo hacer tu autoexploración en casa, de forma cómoda y segura.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

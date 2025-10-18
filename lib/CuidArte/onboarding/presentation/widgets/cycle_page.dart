import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CyclePage extends StatelessWidget {
  const CyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/calendario.json',
              height: 200,
              backgroundLoading: true,
            ),
            const SizedBox(height: 24),
            Text(
              'Registra tu ciclo mestrual',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'Solo ingresa la fecha de inicio de tu menstruación y ',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                children: [
                  TextSpan(
                    text: 'Cuid',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9879A2),
                    ),
                  ),
                  TextSpan(
                    text:
                        'Arte te avisará cuándo es el mejor momento para tu autoexploración.',
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

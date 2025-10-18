import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/lazo_rosa.json',
              height: 200,
              backgroundLoading: true,
            ),
            const SizedBox(height: 24),
            Text.rich(
              TextSpan(
                text: 'Bienvenida a ',
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Cuid',
                    style: GoogleFonts.manrope(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9879A2),
                    ),
                  ),
                  TextSpan(
                    text: 'Arte',
                    style: GoogleFonts.dancingScript(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[200],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tu espacio personal para cuidar de ti misma. Aquí podrás llevar el control de tu ciclo y aprender a realizar tu autoexploración de manera fácil y segura para prevenir el cáncer de mama',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

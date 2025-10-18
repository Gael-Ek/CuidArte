import 'package:cuidarte/CuidArte/onboarding/infrastructure/user_preferences_service.dart';
import 'package:cuidarte/domain/const/app_colors.dart';
import 'package:cuidarte/domain/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();

    // Inicia la animación luego de un pequeño retraso
    Future.delayed(const Duration(seconds: 2), () async {
      setState(() {
        opacity = 0.0;
      });

      Future.delayed(const Duration(seconds: 1), () async {
        if (!mounted) return;

        final prefs = UserPreferencesService();
        final completed = await prefs.isOnboardingCompleted();

        if (completed) {
          if (mounted) {
            context.go(Routes.home);
          }
        } else {
          if (mounted) {
            context.go(Routes.onBoarding);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo.png', width: 150, height: 150),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cuid',
                      style: GoogleFonts.manrope(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF9879A2), // text-color
                      ),
                    ),
                    TextSpan(
                      text: 'Arte',
                      style: GoogleFonts.dancingScript(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF9879A2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

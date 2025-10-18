import 'package:cuidarte/CuidArte/onboarding/infrastructure/user_preferences_service.dart';
import 'package:flutter/material.dart';

class OnboardingController {
  // Controladores
  final PageController pageController = PageController();
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();

  // Estado
  int currentPage = 0;
  final int totalPages = 4;
  String? gender;
  bool acceptTerms = false;

  // Servicios
  final userPrefs = UserPreferencesService();

  // --- NAVEGACIÓN ---
  void nextPage(
    BuildContext context,
    VoidCallback updateState,
    Function onSuccess,
  ) async {
    if (currentPageNotifier.value == 3) {
      // Validar formulario
      if (formKey.currentState!.validate() && acceptTerms) {
        await saveUserData();
        onSuccess();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Por favor completa todos los campos y acepta los términos',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red.shade400,
          ),
        );
      }
      return;
    }

    if (currentPageNotifier.value < totalPages - 1) {
      final next = currentPageNotifier.value + 1;
      pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPageNotifier.value = next;
    }
  }

  void previousPage() {
    if (currentPageNotifier.value > 0) {
      final prev = currentPageNotifier.value - 1;
      pageController.animateToPage(
        prev,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPageNotifier.value = prev;
    }
  }

  void skipToEnd() {
    pageController.animateToPage(
      totalPages - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    currentPageNotifier.value = totalPages - 1;
  }

  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    pageController.dispose();
  }

  //Guardado de datos
  Future<void> saveUserData() async {
    await userPrefs.saveUserData(
      name: '${nameController.text} ${lastNameController.text}',
      age: int.tryParse(ageController.text) ?? 0,
      gender: gender ?? '',
      acceptedTerms: acceptTerms,
    );
    await userPrefs.setOnboardingCompleted(true);
  }

  // Obtener shortName (primer nombre + primer apellido)
  String get shortName {
    final firstName = nameController.text.split(' ').first;
    final firstLastName = lastNameController.text.split(' ').first;
    return '$firstName $firstLastName';
  }
}

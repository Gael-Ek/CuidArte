import 'package:cuidarte/CuidArte/onboarding/infrastructure/user_preferences_service.dart';

class HomeController {
  final userPrefs = UserPreferencesService();

  String? shortName;

  // Función para cargar el nombre de SharedPreferences
  Future<void> loadUserName() async {
    shortName = await userPrefs.getShortName();
  }
}

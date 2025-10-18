import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesService {
  // Singleton: para no crear muchas instancias
  static final UserPreferencesService _instance =
      UserPreferencesService._internal();
  factory UserPreferencesService() => _instance;
  UserPreferencesService._internal();

  /// Guarda los datos del usuario
  Future<void> saveUserData({
    required String name,
    required int age,
    required String gender,
    required bool acceptedTerms,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setInt('user_age', age);
    await prefs.setString('user_gender', gender);
    await prefs.setBool('user_accepted_terms', acceptedTerms);
  }

  /// Carga los datos del usuario
  Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('user_name'),
      'age': prefs.getInt('user_age'),
      'gender': prefs.getString('user_gender'),
      'acceptedTerms': prefs.getBool('user_accepted_terms') ?? false,
    };
  }

  /// Obtiene solo el primer nombre y primer apellido
  Future<String> getShortName() async {
    final prefs = await SharedPreferences.getInstance();
    final fullName = prefs.getString('user_name') ?? '';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts.first;
    return '${parts.first} ${parts[1]}';
  }

  /// Guarda si el usuario completó el onboarding
  Future<void> setOnboardingCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', value);
  }

  /// Verifica si el onboarding ya fue completado
  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }

  /// Limpia todos los datos
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_name');
    await prefs.remove('user_age');
    await prefs.remove('user_gender');
    await prefs.remove('user_accepted_terms');
  }
}

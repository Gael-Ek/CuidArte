// lib/application/validators/form_validators.dart

class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor ingresa tus nombres';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor ingresa tus apellidos';
    }

    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu edad';
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0 || age > 120) {
      return 'Edad no válida';
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Selecciona tu sexo';
    }
    return null;
  }

  static String? validateTerms(bool accepted) {
    if (!accepted) {
      return 'Debes aceptar los términos y condiciones';
    }
    return null;
  }
}

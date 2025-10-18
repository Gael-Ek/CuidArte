import 'package:flutter/material.dart';
import 'package:cuidarte/CuidArte/onboarding/application/onboarding_controller.dart';
import 'package:cuidarte/CuidArte/onboarding/domain/validators/form_validator.dart';

class FormPage extends StatefulWidget {
  final OnboardingController controller;

  const FormPage({super.key, required this.controller});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cuéntanos un poco sobre ti 💗',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Completa todos los campos para continuar con tu proceso de prevención.',
                style: TextStyle(color: Colors.grey[700], height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Nombres *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person_outline),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: FormValidators.validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.lastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellidos *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person_outline),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: FormValidators.validateLastName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.ageController,
                decoration: InputDecoration(
                  labelText: 'Edad *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.cake_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: FormValidators.validateAge,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Sexo *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.wc_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                initialValue: controller.gender,
                items: const [
                  DropdownMenuItem(value: 'Femenino', child: Text('Femenino')),
                  DropdownMenuItem(
                    value: 'Masculino',
                    child: Text('Masculino'),
                  ),
                  DropdownMenuItem(
                    value: 'Prefiero no decirlo',
                    child: Text('Prefiero no decirlo'),
                  ),
                ],
                validator: FormValidators.validateGender,
                onChanged: (value) =>
                    setState(() => controller.gender = value!),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: controller.acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        controller.acceptTerms = value ?? false;
                      });
                    },
                    activeColor: Colors.pink.shade400,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: 'Acepto los ',
                          style: TextStyle(color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: 'términos y condiciones *',
                              style: TextStyle(
                                color: Colors.pink.shade600,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

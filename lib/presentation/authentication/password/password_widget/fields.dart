import 'package:flutter/material.dart';
import 'package:trek_trak/presentation/authentication/Sign_up/sign_widget/sign_textfield.dart';
import 'package:trek_trak/utils/validator.dart';

class coustomPassword extends StatelessWidget {
  const coustomPassword({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmpasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmpasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                controller: passwordController,
                labelText: 'password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                validator: (value) =>
                    Validator().passwordValidator(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                controller: confirmpasswordController,
                labelText: 'Confirm password',
                hintText: 'Confirm your password',
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => Validator()
                    .confirmPasswordValidator(
                        value, passwordController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

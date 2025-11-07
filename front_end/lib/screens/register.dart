import 'package:flutter/material.dart';
import 'package:front_end/widgets/register_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register'),),
      body: RegisterForm(),
    );
  }

}
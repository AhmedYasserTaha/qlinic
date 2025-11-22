import 'package:flutter/material.dart';
import 'package:qlinic/features/auth/presentation/view/widget/login_body/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(body: const LoginBody()),
    );
  }
}

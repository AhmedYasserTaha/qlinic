import 'package:flutter/material.dart';
import 'package:qlinic/features/auth/presentation/view/widget/sign_up_body/sing_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(resizeToAvoidBottomInset: true, body: SingUpBody()),
    );
  }
}

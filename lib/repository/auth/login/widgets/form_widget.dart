import 'package:bloc_login/repository/auth/login/widgets/password_textfield.dart';
import 'package:bloc_login/repository/auth/login/widgets/username_textfield.dart';
import 'package:flutter/material.dart';

import 'login_button.dart';

class FormWidget extends StatelessWidget{
   FormWidget({super.key});

  final GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Form(
        key: _formKey,
        child: Column(
          children: [
            UsernameTextField(),
            PasswordTextField(),
            LoginButton(
              formKey: _formKey,
            ),
          ],
        ));
  }
}

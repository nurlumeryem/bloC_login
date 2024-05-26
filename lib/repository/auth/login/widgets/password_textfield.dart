import 'package:bloc_login/blocs/auth/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/auth/login/login_bloc.dart';
import '../../../../blocs/auth/login/login_state.dart';

class PasswordTextField extends StatelessWidget{
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder:((context,state){
          return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.key),
        hintText: "Password"
            ),
            validator: (value)=> state.isValidPassword ? null : "Password is not long enough ",
            onChanged: (value) => context.read<LoginBloc>()
                .add(LoginPasswordChanged(password: value)),
          );
        }),
    );
  }
}

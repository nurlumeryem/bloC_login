
import 'package:bloc_login/blocs/auth/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/auth/login/login_bloc.dart';
import '../../../../blocs/auth/login/login_state.dart';

class UsernameTextField extends StatelessWidget{
  const UsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
       builder:((context,state){
       return TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.person),
              hintText: "Username"
          ),
         validator: (value)=> state.isValidUsername ? null : "Username is not long enough ",
         onChanged: (value) => context.read<LoginBloc>()
             .add(LoginUsernameChanged(username: value)),
       );
    }));
  }
}

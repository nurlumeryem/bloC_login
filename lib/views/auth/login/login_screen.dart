import 'package:bloc_login/blocs/auth/login/login_bloc.dart';
import 'package:bloc_login/repository/auth/login/login_repository.dart';
import 'package:bloc_login/repository/auth/login/widgets/form_widget.dart';
import 'package:bloc_login/views/auth/form_submisson_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/login/login_state.dart';

class LoginScreen extends StatelessWidget{
    LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) => LoginBloc(authRepo: context.read<LoginRepository>()),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: ((previous, current) => previous.formStatus != current.formStatus),
        listener: (context,state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissonFailed) {
             _showSnackBar(context, formStatus.exception.toString());
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("asset/images/ic_chef.png"),
                FormWidget()
              ],
            ),
          ),
        ),
      ),
      )
    );
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


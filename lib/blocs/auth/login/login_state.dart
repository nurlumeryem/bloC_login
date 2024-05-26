import 'package:bloc_login/views/auth/form_submisson_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable{

  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  const LoginState({ required this.username, required this.password,  required this.formStatus});
  bool get isValidUsername => username.length >3;
  bool get isValidPassword => password.length >6;
  LoginState copyWrite(
  {String? username, String? password, FormSubmissionStatus? formStatus })
  {
    return LoginState(username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
  @override
  List<Object?> get props => [username, password, formStatus];
}
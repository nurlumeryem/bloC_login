import 'package:bloc_login/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../views/auth/form_submisson_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;

  LoginBloc({this.authRepo}) : super(LoginState(username: '', password: '', formStatus: InitialFormStatus())) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future<void> mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUsernameChanged) {
      emit(state.copyWrite(username: event.username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWrite(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWrite(formStatus: FormSubmitting()));

      try {
        await authRepo?.login(state.username, state.password); // Assuming login method takes username and password
        emit(state.copyWrite(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWrite(formStatus: SubmissonFailed(e)));
      }
    }
  }
}

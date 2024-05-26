# 🟦 Bloc Nedir ve Neden Kullanıyorum?

## Bloc Nedir?

**Bloc** (Business Logic Component), Flutter uygulamalarında iş mantığını yönetmek için kullanılan bir state management kütüphanesidir. Bloc, iş mantığını (business logic) kullanıcı arayüzünden (UI) ayırarak kodun daha okunabilir, test edilebilir ve yönetilebilir olmasını sağlar. Bloc, bir "state management" (durum yönetimi) çözümüdür ve Dart programlama dilinde yazılmıştır.

## Neden Bloc Kullanıyorum?

Bloc kullanmamın birkaç önemli nedeni var:

1. **🔄 Ayrılmış İş Mantığı ve UI:**
   Bloc, iş mantığını UI'dan ayırır. Bu, uygulamanın farklı bölümlerinin bağımsız olarak geliştirilebilmesini ve test edilebilmesini sağlar. UI bileşenleri yalnızca görünümle ilgilenirken, Bloc sınıfları veri işleme ve iş mantığı ile ilgilenir.

2. **🧪 Daha İyi Test Edilebilirlik:**
   İş mantığını ayrı bileşenlerde tutmak, test yazmayı kolaylaştırır. Bloc, iş mantığını belirli senaryolar için test etmeyi kolaylaştıran bir yapıya sahiptir.

3. **📊 Öngörülebilir Durum Yönetimi:**
   Bloc, uygulamanın durumunu (state) yönetmek için belirli bir yapı sağlar. Bu yapı sayesinde uygulamanın her an hangi durumda olduğu ve bu duruma nasıl ulaşıldığı açıkça görülebilir ve yönetilebilir.

4. **♻️ Yeniden Kullanılabilir Kod:**
   Bloc kullanarak yazılan iş mantığı kodu, uygulamanın farklı yerlerinde tekrar kullanılabilir. Bu, kodun tekrarını azaltır ve geliştirme sürecini hızlandırır.

## Nasıl Kullanıyorum?

Bu projede, kullanıcı adı ve şifre ile giriş işlemlerini yönetmek için Bloc yapısını kullanıyorum. İş mantığını `LoginBloc` adlı bir sınıfta topladım. Bu sınıf, kullanıcının giriş bilgilerini alır, doğrulama işlemlerini yapar ve sonuçları UI bileşenlerine iletir.

Bloc kullanarak login işlemini yönetmek, kodun daha temiz, düzenli ve sürdürülebilir olmasını sağlıyor. Aşağıda bu yapı ile ilgili basit bir örnek bulabilirsiniz:

```dart
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
      emit(state.copyWith(username: event.username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo?.login(state.username, state.password);
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
      }
    }
  }
}

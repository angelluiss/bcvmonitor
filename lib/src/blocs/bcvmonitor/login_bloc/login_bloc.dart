import 'dart:async';

import 'package:bcvapp/src/repository/api_repository.dart';
import 'package:bcvapp/src/utils/share_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bcvapp/src/models/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository _apiRepository = ApiRepository();

  LoginBloc(LoginState initialState) : super(initialState);

  LoginState get initialState => const LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginBCV) {
      try {
        yield const LoginLoading();
        if (await _getToken() == '') {
          final login = await _apiRepository.loginBCVMonitor();
          _saveSharePreference(login);
          yield LoginLoaded(login);
        }
        yield const LoginCached();

        // yield LoginError(login.token);
      } on NetworkError {
        yield const LoginError("Failed to fetch data. is your device online?");
      }
    }
  }

  _saveSharePreference(LoginModel model) {
    BCVPreferences.setToken(model.token);
  }

  Future<String> _getToken() {
    return BCVPreferences.getToken();
  }
}

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginBCV extends LoginEvent {
  @override
  List<Object> get props => [];
}

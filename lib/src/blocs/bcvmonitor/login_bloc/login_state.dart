part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginState {
  final LoginModel loginModel;
  const LoginLoaded(this.loginModel);
  @override
  List<Object> get props => [loginModel];
}

class LoginCached extends LoginState {
  const LoginCached();
  @override
  List<bool> get props => [true];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
  @override
  List<Object> get props => [message];
}

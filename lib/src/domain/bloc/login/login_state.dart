part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {

  List<Object> get props => [];
}
class LoginSuccessful extends LoginState  {
  final User user;

  const LoginSuccessful(this.user);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginSuccessful && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
class LoginLoading extends LoginState  {
  const LoginLoading();
}
class LogoutSuccessful extends LoginState  {
  const LogoutSuccessful();
}
class LoginError extends LoginState  {
  final String  message;
  const LoginError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

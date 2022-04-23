part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {
  const SignUpState ();
}

class SignUpInitial extends SignUpState {

  List<Object> get props => [];

}
class SignUpRegistered extends SignUpState {
  final  User user;

  const SignUpRegistered(this.user);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SignUpRegistered && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
class SignUpLoading extends SignUpState {
  const SignUpLoading();
}
class SignUpError extends SignUpState {
  final String  message;
  const SignUpError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SignUpError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
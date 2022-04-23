part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}
class LoginByEmail extends LoginEvent{
  final String email,password;
  const LoginByEmail({required this.email,required  this.password}) ;

}

class LoginWithGoogle extends LoginEvent{
final token;
  const LoginWithGoogle({this.token});

}
class LoginWithFacebook extends LoginEvent{
  final token;
  const LoginWithFacebook({this.token});

}

class Logout extends LoginEvent{
 final userId;
  const Logout({this.userId});


}
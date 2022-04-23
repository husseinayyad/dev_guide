part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  const SignUpEvent();
}
class SignUpByEmail extends SignUpEvent{
 final Map jsonMap;
  const SignUpByEmail(this.jsonMap);

}

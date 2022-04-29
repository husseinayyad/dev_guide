import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/user.dart';
import 'package:dev_guide/src/domain/repository/app_repository.dart';
import 'package:dev_guide/src/domain/repository/user_repository.dart';

import 'package:meta/meta.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  final UserRepository _userRepository = UserRepository();



  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LoginByEmail) {
      yield* _loginByEmail(event.email,event.password);
    }

  }

  Stream<LoginState> _loginByEmail(email,password) async* {

      yield const LoginLoading();
      await _userRepository.login(email, password).then(
            (usecaseResult) async {
          usecaseResult.fold(
                (failure) {
              emit(LoginError(failure.message));
            },
                (user) {
              _saveUserInfo(user);
              emit(LoginSuccessful(user));
            },
          );
        },
      );



}
  ///[user] model user data to save data in  local data base
  void _saveUserInfo(User user) {
    AppRepo appRepository = AppRepo();

    appRepository.setUserInfo(
      userId: user.userId,
      userEmail: user.userEmail,
      userName: user.userName,
    );
  }
}

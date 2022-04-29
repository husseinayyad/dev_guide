import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_guide/src/core/helper/valueHolder.dart';
import 'package:dev_guide/src/data/failure.dart';
import 'package:dev_guide/src/domain/model/user.dart';
import 'package:dev_guide/src/domain/repository/app_repository.dart';
import 'package:dev_guide/src/domain/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());
  final UserRepository _userRepository = UserRepository();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is SignUpByEmail) {
      yield* _signUpByEmail(event.jsonMap);
    }
  }

  Stream<SignUpState> _signUpByEmail(jsonMap) async* {
    yield const SignUpLoading();
    await _userRepository.register(jsonMap).then(
      (usecaseResult) async {
        usecaseResult.fold(
          (failure) {
            emit(SignUpError(failure.message));
          },
          (user) {
            _saveUserInfo(user);
            emit(SignUpRegistered(user));
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

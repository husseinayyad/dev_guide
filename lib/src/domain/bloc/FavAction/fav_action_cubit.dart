import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'fav_action_state.dart';

class FavActionCubit extends Cubit<FavActionState> {
  FavActionCubit() : super(FavActionInitial());

  final UserRepository _userRepository = UserRepository();
  Future<void> favAction(bool add,String id,List favList) async {
    emit(const FavActionLoading());
    await _userRepository.favAction(add, id,favList).then(
          (usecaseResult) async {
        usecaseResult.fold(
              (failure) {
            emit(FavActionError(failure.message));
          },
              (fav) {
            emit(FavAction());
          },
        );
      },
    );
  }
}

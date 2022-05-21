part of 'fav_action_cubit.dart';

@immutable
abstract class FavActionState {
  const FavActionState();
}

class FavActionInitial extends FavActionState {}
class FavActionLoading extends FavActionState {
  const FavActionLoading();
}
class FavAction extends FavActionState {

  const FavAction();
}
class FavActionError extends FavActionState {
  final String message;
  const FavActionError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FavActionError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

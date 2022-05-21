part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState { List<Object> get props => [];

}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}
class FavoritesLoaded extends FavoritesState {
  final List<Course> courses;

  const FavoritesLoaded(this.courses);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FavoritesLoaded && o.courses == courses;
  }

  @override
  int get hashCode => courses.hashCode;
}

class FavoritesError extends FavoritesState {
  final String message;
  const FavoritesError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FavoritesError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
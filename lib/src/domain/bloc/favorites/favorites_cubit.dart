import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/course.dart';
import 'package:dev_guide/src/domain/repository/courses_repository.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  final CoursesRepository _coursesRepository = CoursesRepository();

  Future<void> getFavCourses(String userId) async {
    emit(const FavoritesLoading());
    await _coursesRepository.getFavCourses(userId).then(
          (usecaseResult) async {
        usecaseResult.fold(
              (failure) {
            emit(FavoritesError(failure.message));
          },
              (favList) {
            emit(FavoritesLoaded(favList));
          },
        );
      },
    );
  }
}

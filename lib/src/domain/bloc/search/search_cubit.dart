import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/category.dart';
import 'package:dev_guide/src/domain/model/course.dart';

import 'package:dev_guide/src/domain/repository/courses_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
     SearchCubit() : super(SearchInitial());
  final CoursesRepository _coursesRepository = CoursesRepository();
  
    Future<void> getCoursesByName(String name) async {
    emit(const SearchLoading());
    await _coursesRepository.getCoursesByNameList(name).then(
      (usecaseResult) async {
        usecaseResult.fold(
          (failure) {
            emit(SearchError(failure.message));
          },
          (category) {
            emit(SearchLoaded(category));
          },
        );
      },
    );
  }
}

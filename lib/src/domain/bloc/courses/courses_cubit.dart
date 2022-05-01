import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/category.dart';
import 'package:dev_guide/src/domain/model/course.dart';

import 'package:dev_guide/src/domain/repository/courses_repository.dart';
import 'package:equatable/equatable.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
     CoursesCubit() : super(CoursesInitial());
  final CoursesRepository _coursesRepository = CoursesRepository();
  Future<void> getCourses(String subCatgId) async {
    emit(const CoursesLoading());
    await _coursesRepository.getCoursesList(subCatgId).then(
      (usecaseResult) async {
        usecaseResult.fold(
          (failure) {
            emit(CoursesError(failure.message));
          },
          (category) {
            emit(CoursesLoaded(category));
          },
        );
      },
    );
  }
 
}

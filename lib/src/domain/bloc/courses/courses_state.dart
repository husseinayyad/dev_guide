part of 'courses_cubit.dart';


abstract class CoursesState {
  const CoursesState();
}



class CoursesInitial extends CoursesState {

  List<Object> get props => [];
}
class CoursesLoading extends CoursesState {
  const CoursesLoading();
}
class CoursesLoaded extends CoursesState {
  final List<Course> courses;

  const CoursesLoaded(this.courses);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CoursesLoaded && o.courses == courses;
  }

  @override
  int get hashCode => courses.hashCode;
}

class CoursesError extends CoursesState {
  final String message;
  const CoursesError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CoursesError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


part of 'search_cubit.dart';


abstract class SearchState {
  const SearchState();
}



class SearchInitial extends SearchState {

  List<Object> get props => [];
}
class SearchLoading extends SearchState {
  const SearchLoading();
}
class SearchLoaded extends SearchState {
  final List<Course> courses;

  const SearchLoaded(this.courses);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchLoaded && o.courses == courses;
  }

  @override
  int get hashCode => courses.hashCode;
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


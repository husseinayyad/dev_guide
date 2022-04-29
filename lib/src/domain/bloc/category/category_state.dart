part of 'category_cubit.dart';


abstract class CategoryState {
  const CategoryState();
}



class CategoryInitial extends CategoryState {

  List<Object> get props => [];
}
class CategoryLoading extends CategoryState {
  const CategoryLoading();
}
class CategoryLoaded extends CategoryState {
  final List<Category> category;

  const CategoryLoaded(this.category);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryLoaded && o.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


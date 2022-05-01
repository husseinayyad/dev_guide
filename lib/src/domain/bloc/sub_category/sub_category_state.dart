part of 'sub_category_cubit.dart';


abstract class SubCategoryState {
  const SubCategoryState();
}



class SubCategoryInitial extends SubCategoryState {

  List<Object> get props => [];
}
class SubCategoryLoading extends SubCategoryState {
  const SubCategoryLoading();
}
class SubCategoryLoaded extends SubCategoryState {
  final List<SubCategory> category;

  const SubCategoryLoaded(this.category);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubCategoryLoaded && o.category == category;
  }

  @override
  int get hashCode => category.hashCode;
}

class SubCategoryError extends SubCategoryState {
  final String message;
  const SubCategoryError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubCategoryError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


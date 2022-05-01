import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/category.dart';
import 'package:dev_guide/src/domain/model/sub_category.dart';
import 'package:dev_guide/src/domain/repository/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
     SubCategoryCubit() : super(SubCategoryInitial());
  final CategoryRepository _categoryRepository = CategoryRepository();
  Future<void> getSubCategory(String catgId) async {
    emit(const SubCategoryLoading());
    await _categoryRepository.getSubCategoryList(catgId).then(
      (usecaseResult) async {
        usecaseResult.fold(
          (failure) {
            emit(SubCategoryError(failure.message));
          },
          (category) {
            emit(SubCategoryLoaded(category));
          },
        );
      },
    );
  }
}

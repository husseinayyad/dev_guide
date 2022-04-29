import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/category.dart';
import 'package:dev_guide/src/domain/repository/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
     CategoryCubit() : super(CategoryInitial());
  final CategoryRepository _categoryRepository = CategoryRepository();
  Future<void> getCategory() async {
    emit(const CategoryLoading());
    await _categoryRepository.getCategoryList().then(
      (usecaseResult) async {
        usecaseResult.fold(
          (failure) {
            emit(CategoryError(failure.message));
          },
          (category) {
            emit(CategoryLoaded(category));
          },
        );
      },
    );
  }
}

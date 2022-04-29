
import 'package:bloc/bloc.dart';
import 'package:dev_guide/src/domain/model/slider.dart';
import 'package:dev_guide/src/domain/repository/slider_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());
  final SliderRepository _slidersRepository=   SliderRepository();
  Future<void> getSliders() async {
    emit( const SlidersLoading());
    await _slidersRepository.getSliderList().then(
          (usecaseResult) async {
        usecaseResult.fold(
              (failure) {
            emit(SlidersError(failure.message));
          },
              (slider) {

            emit(SlidersLoaded(slider));
          },
        );
      },
    );
  }
}

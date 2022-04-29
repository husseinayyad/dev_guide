part of 'sliders_cubit.dart';

@immutable
abstract class SlidersState {
  const SlidersState();
}



class SlidersInitial extends SlidersState {

  List<Object> get props => [];
}
class SlidersLoading extends SlidersState {
  const SlidersLoading();
}
class SlidersLoaded extends SlidersState {
  final List<Slider> slider;

  const SlidersLoaded(this.slider);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SlidersLoaded && o.slider == slider;
  }

  @override
  int get hashCode => slider.hashCode;
}

class SlidersError extends SlidersState {
  final String message;
  const SlidersError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SlidersError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}


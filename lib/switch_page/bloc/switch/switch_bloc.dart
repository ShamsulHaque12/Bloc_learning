import 'package:bloc/bloc.dart';
import 'package:counter_num_bloc/switch_page/bloc/switch/switch_event.dart';
import 'package:counter_num_bloc/switch_page/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableSwitch>(_onEnableOrDisableSwitch);
    on<SliderEvent>(_onSliderEvent);
  }

  void _onEnableOrDisableSwitch(
    EnableOrDisableSwitch event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isEnabled: !state.isEnabled));
  }

  void _onSliderEvent(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}

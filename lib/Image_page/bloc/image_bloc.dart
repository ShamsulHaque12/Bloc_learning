import 'package:counter_num_bloc/Image_page/bloc/image_event.dart';
import 'package:counter_num_bloc/Image_page/bloc/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePicker _imagePicker = ImagePicker();

  ImagePickerBloc() : super(const ImagePickerState()) {
    on<CameraCaptureRequested>(_onCameraCaptureRequested);
    on<GalleryCaptureRequested>(_onGalleryCaptureRequested);
  }

  void _onCameraCaptureRequested(
    CameraCaptureRequested event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      emit(state.copyWith(image: file));
    }
  }

  void _onGalleryCaptureRequested(
    GalleryCaptureRequested event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      emit(state.copyWith(image: file));
    }
  }
}

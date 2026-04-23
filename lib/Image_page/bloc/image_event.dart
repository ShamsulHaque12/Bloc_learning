import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object?> get props => [];
}

class CameraCaptureRequested extends ImagePickerEvent {}

class GalleryCaptureRequested extends ImagePickerEvent {}

part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class InitializeControllerEvent extends CameraEvent {}

// class InitEffectsEvent extends CameraEvent {}

class GetEffectsFromAssetsEvent extends CameraEvent {}

class GetFiltersFromAssetsEvent extends CameraEvent {}

class GetMasksFromAssetsEvent extends CameraEvent {}

class ShowHideFilterListEvent extends CameraEvent {}

class ShowHideEffectListEvent extends CameraEvent {}

class ShowHideMaskListEvent extends CameraEvent {}

class GetNextEffectEvent extends CameraEvent {}

class GetPrevEffectEvent extends CameraEvent {}

class GetNextMaskEvent extends CameraEvent {}

class GetPrevMaskEvent extends CameraEvent {}

class GetNextFilterEvent extends CameraEvent {}

class GetPrevFilterEvent extends CameraEvent {}

class ToggleFlashEvent extends CameraEvent {}

class ToggleCaptureEvent extends CameraEvent {
  final CaptureState captureState;

  const ToggleCaptureEvent(this.captureState);

  @override
  List<Object> get props => [captureState];

}

class FlipCameraEvent extends CameraEvent {}

class SwitchFilterEvent extends CameraEvent {
  final String filter;

  const SwitchFilterEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

class SwitchEffectEvent extends CameraEvent {
  final String effect;

  const SwitchEffectEvent(this.effect);

  @override
  List<Object> get props => [effect];
}

class SwitchFaceMaskEvent extends CameraEvent {
  final String faceMask;

  const SwitchFaceMaskEvent(this.faceMask);

  @override
  List<Object> get props => [faceMask];
}

class StartRecordingEvent extends CameraEvent {}

class StopRecordingEvent extends CameraEvent {}

class TakeScreenShotEvent extends CameraEvent {}

class OpenGalleryEvent extends CameraEvent {}


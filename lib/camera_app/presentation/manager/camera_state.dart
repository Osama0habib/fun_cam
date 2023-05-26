part of 'camera_bloc.dart';

class CameraState extends Equatable {
  final DeepArController? controller ;
  final CaptureState captureState ;
  final CameraDirection cameraDirection;
  final bool showFilterList;
  final bool showEffectList;
  final bool showMaskList;
  final bool flashOn;
  final bool isRecording;
  final String version;
  final bool isFaceMask;
  final bool isFilter;
  final Status effectsStatus;
  final Status filtersStatus;
  final Status masksStatus;
  final String message;
  final List<ArModel> effectsList;
  final List<ArModel> maskList;
  final List<ArModel> filterList;
  final int effectIndex;
  final int maskIndex;
  final int filterIndex;
  const CameraState({
    this.isRecording = false,
    this.cameraDirection = CameraDirection.front,
    this.captureState = CaptureState.photo,
    this.flashOn = false,
    this.showEffectList = false,
    this.showFilterList = false,
    this.showMaskList = false,
    this.message = "",
    this.version = "",
    this.isFaceMask = false,
    this.isFilter = false,
    this.effectsStatus = Status.init,
    this.filtersStatus = Status.init,
    this.masksStatus = Status.init,
    this.effectsList = const [ArModel(file: "null", image: "assets/images/error.png", filterType: FilterType.effect)],
    this.maskList = const [ArModel(file: "null", image: "assets/images/error.png", filterType: FilterType.mask)],
    this.filterList = const [ArModel(file: "null", image: "assets/images/error.png", filterType: FilterType.filter)],
    this.effectIndex = 0,
    this.maskIndex = 0,
    this.filterIndex = 0,
    this.controller});

  CameraState copyWith({
    CameraDirection? cameraDirection,
    CaptureState? captureState,
    bool? flashOn,
    bool? showEffectList,
    bool? showFilterList,
    bool? showMaskList,
    bool? isRecording,
    String? message,
    DeepArController? controller,
    String? version,
    bool? isFaceMask,
    bool? isFilter,
    List<ArModel>? effectsList,
    List<ArModel>? maskList,
    List<ArModel>? filterList,
    int? effectIndex,
    int? maskIndex,
    Status? effectsStatus,
    Status? filtersStatus,
    Status? masksStatus,
    int? filterIndex,
  }){
    return CameraState(
      isRecording: isRecording ?? this.isRecording,
      captureState: captureState ?? this.captureState,
      flashOn: flashOn ?? this.flashOn,
      cameraDirection: cameraDirection ?? this.cameraDirection,
      showEffectList: showEffectList ?? this.showEffectList,
      showFilterList: showFilterList ?? this.showFilterList,
      showMaskList: showMaskList ?? this.showMaskList,

      message: message ?? this.message,
      controller: controller ?? this.controller,
      version: version ?? this.version,
      effectsStatus: effectsStatus ?? this.effectsStatus,
      filtersStatus: filtersStatus ?? this.filtersStatus,
      masksStatus: masksStatus ?? this.masksStatus,
      isFaceMask: isFaceMask ?? this.isFaceMask,
      isFilter: isFilter ?? this.isFilter,
      effectsList: effectsList ?? this.effectsList,
      maskList: maskList ?? this.maskList,
      filterList: filterList ?? this.filterList,
      effectIndex: effectIndex ?? this.effectIndex,
      maskIndex: maskIndex ?? this.maskIndex,
      filterIndex: filterIndex ?? this.filterIndex,

    );
}

  @override
  List<Object?> get props =>
      [
        cameraDirection,
        isRecording,
        captureState,
        flashOn,
        showEffectList,
        showFilterList,
        showMaskList,
        message,
        controller,
        version,
        isFaceMask,
        isFilter,
        effectsList,
        maskList,
        filterList,
        effectIndex,
        maskIndex,
        filterIndex,
        filtersStatus,
        masksStatus,
        effectsStatus,
      ];
}

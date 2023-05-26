import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_cam/auth/secrets.dart';
import 'package:fun_cam/camera_app/data/model/ar_model.dart';
import 'package:fun_cam/camera_app/domain/use_cases/get_effects_from_assets_usecase.dart';
import 'package:fun_cam/camera_app/domain/use_cases/get_filters_from_assets_usecase.dart';
import 'package:fun_cam/camera_app/domain/use_cases/get_masks_from_assets_usecase.dart';
import 'package:fun_cam/core/utils/app_constant.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/utils/enums.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final GetEffectsFromAssetsUseCase getEffectsFromAssetsUseCase;
  final GetFiltersFromAssetsUseCase getFiltersFromAssetsUseCase;
  final GetMasksFromAssetsUseCase getMasksFromAssetsUseCase;

  CameraBloc(
    this.getEffectsFromAssetsUseCase,
    this.getFiltersFromAssetsUseCase,
    this.getMasksFromAssetsUseCase,
  ) : super(const CameraState()) {
    on<InitializeControllerEvent>(_initializeController);
    on<GetEffectsFromAssetsEvent>(_getEffectsFromAssets);
    on<GetFiltersFromAssetsEvent>(_getFiltersFromAssets);
    on<GetMasksFromAssetsEvent>(_getMasksFromAssets);
    on<TakeScreenShotEvent>(_takeScreenShot);
    on<ToggleFlashEvent>(_toggleFlash);
    on<FlipCameraEvent>(_flipCamera);
    on<SwitchFilterEvent>(_switchFilter);
    on<SwitchEffectEvent>(_switchEffect);
    on<SwitchFaceMaskEvent>(_switchFaceMask);
    on<StartRecordingEvent>(_startRecording);
    on<StopRecordingEvent>(_stopRecording);
    on<ToggleCaptureEvent>(_toggleCapture);
    on<GetNextEffectEvent>(_getNextEffect);
    on<GetPrevEffectEvent>(_getPrevEffect);
    on<GetNextFilterEvent>(_getNextFilter);
    on<GetPrevFilterEvent>(_getPrevFilter);
    on<GetNextMaskEvent>(_getNextMask);
    on<GetPrevMaskEvent>(_getPrevMask);
    on<ShowHideFilterListEvent>(_showHideFilterList);
    on<ShowHideEffectListEvent>(_showHideEffectList);
    on<ShowHideMaskListEvent>(_showHideMaskList);
  }

  FutureOr<void> _initializeController(
      InitializeControllerEvent event, Emitter<CameraState> emit) async {
    final controller = DeepArController();
    await controller.initialize(
      androidLicenseKey:
          deepArAndroidKey, // replace with deepAr AndroidLicenseKey.
      iosLicenseKey:
          deepArIosKey, // replace with deepAr iosLicenseKey.
      resolution: Resolution.veryHigh,
    );
    emit(state.copyWith(
      controller: controller,
    ));
  }

  FutureOr<void> _getEffectsFromAssets(
      GetEffectsFromAssetsEvent event, Emitter<CameraState> emit) async {
    final result = await getEffectsFromAssetsUseCase();
    print(result);
    result.fold(
        (l) => emit(
            state.copyWith(effectsStatus: Status.error, message: l.message)),
        (r) =>
            emit(state.copyWith(effectsStatus: Status.loaded, effectsList: r)));
  }

  FutureOr<void> _getFiltersFromAssets(
      GetFiltersFromAssetsEvent event, Emitter<CameraState> emit) async {
    final result = await getFiltersFromAssetsUseCase();
    print(result);
    result.fold(
        (l) => emit(
            state.copyWith(filtersStatus: Status.error, message: l.message)),
        (r) =>
            emit(state.copyWith(filtersStatus: Status.loaded, filterList: r)));
  }

  FutureOr<void> _getMasksFromAssets(
      GetMasksFromAssetsEvent event, Emitter<CameraState> emit) async {
    final result = await getMasksFromAssetsUseCase();
    print(result);
    result.fold(
        (l) =>
            emit(state.copyWith(masksStatus: Status.error, message: l.message)),
        (r) => emit(state.copyWith(masksStatus: Status.loaded, maskList: r)));
  }

  Future<FutureOr<void>> _takeScreenShot(
      TakeScreenShotEvent event, Emitter<CameraState> emit) async {
    print("TakeScreenShot");
    await state.controller?.takeScreenshot().then((file) async {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String fileName = AppConstant.getImageName(file.path); // Filename without extension
      // const String fileExtension = ".jpg";
      print(file);
      File galleryFile = await file.copy("${path}/$fileName");
      OpenFile.open(galleryFile.path);



      await GallerySaver.saveImage(file.path,albumName: "FunCam");
      // emit(state.copyWith());
    });
  }

  Future<FutureOr<void>> _toggleFlash(
      ToggleFlashEvent event, Emitter<CameraState> emit) async {
   final flashOn = await state.controller?.toggleFlash();
    emit(state.copyWith(flashOn: flashOn));
  }

  Future<FutureOr<void>> _flipCamera(
      FlipCameraEvent event, Emitter<CameraState> emit) async {
    await state.controller?.flipCamera();
    if(state.controller?.cameraDirection.name == CameraDirection.rear.name) {
      emit(state.copyWith(cameraDirection: CameraDirection.rear));
    }else{
      emit(state.copyWith(cameraDirection: CameraDirection.front));
    }
  }

  Future<FutureOr<void>> _switchFilter(
      SwitchFilterEvent event, Emitter<CameraState> emit) async {
    print("event : ${event.filter}");

    // await state.controller?.switchEffect("null");
    // await state.controller?.switchFaceMask("null");
    emit(state.copyWith(showMaskList: false,showEffectList: false,showFilterList: false));
    await state.controller?.switchFilter(event.filter.toString());
  }

  Future<FutureOr<void>> _switchEffect(
      SwitchEffectEvent event, Emitter<CameraState> emit) async {
    print("event : ${event.effect}");
    // await state.controller?.switchFaceMask("null");
    // await state.controller?.switchFilter("null");
    emit(state.copyWith(showMaskList: false,showEffectList: false,showFilterList: false));
    await state.controller?.switchFilter(event.effect.toString());
  }

  Future<FutureOr<void>> _switchFaceMask(
      SwitchFaceMaskEvent event, Emitter<CameraState> emit) async {
    print("event : ${event.faceMask}");
    // await state.controller?.switchEffect("null");
    // await state.controller?.switchFilter("null");
    emit(state.copyWith(showMaskList: false,showEffectList: false,showFilterList: false));
    await state.controller?.switchFilter(event.faceMask.toString());
  }

  FutureOr<void> _startRecording(
      StartRecordingEvent event, Emitter<CameraState> emit) async {
    await state.controller?.startVideoRecording();
    emit(state.copyWith(isRecording: true));
  }

  Future<FutureOr<void>> _stopRecording(
      StopRecordingEvent event, Emitter<CameraState> emit) async {
    File? file = await state.controller?.stopVideoRecording();
    OpenFile.open(file?.path);
    GallerySaver.saveVideo(file!.path);
    emit(state.copyWith(isRecording: false));
  }

  FutureOr<void> _getNextEffect(
      GetNextEffectEvent event, Emitter<CameraState> emit) {
    int index = state.effectIndex;
    if (state.effectIndex < state.effectsList.length) {
      index++;
      emit(state.copyWith(effectIndex: index));
    } else {
      emit(state.copyWith(effectIndex: 0));
    }
  }

  FutureOr<void> _getPrevEffect(
      GetPrevEffectEvent event, Emitter<CameraState> emit) {
    int index = state.effectIndex;
    if (state.effectIndex > 0) {
      index--;
      emit(state.copyWith(effectIndex: index));
    } else {
      emit(state.copyWith(effectIndex: state.effectsList.length));
    }
  }

  FutureOr<void> _getNextFilter(
      GetNextFilterEvent event, Emitter<CameraState> emit) {
    int index = state.filterIndex;
    if (state.filterIndex < state.filterList.length) {
      index++;
      emit(state.copyWith(filterIndex: index));
    } else {
      emit(state.copyWith(filterIndex: 0));
    }
  }

  FutureOr<void> _getPrevFilter(
      GetPrevFilterEvent event, Emitter<CameraState> emit) {
    int index = state.filterIndex;
    if (state.filterIndex > 0) {
      index--;
      emit(state.copyWith(filterIndex: index));
    } else {
      emit(state.copyWith(filterIndex: state.filterList.length));
    }
  }

  FutureOr<void> _getNextMask(
      GetNextMaskEvent event, Emitter<CameraState> emit) {
    int index = state.maskIndex;
    if (state.maskIndex < state.maskList.length) {
      index++;
      emit(state.copyWith(maskIndex: index));
    } else {
      emit(state.copyWith(maskIndex: 0));
    }
  }

  FutureOr<void> _getPrevMask(
      GetPrevMaskEvent event, Emitter<CameraState> emit) {
    int index = state.maskIndex;
    if (state.maskIndex > 0) {
      index--;
      emit(state.copyWith(maskIndex: index));
    } else {
      emit(state.copyWith(maskIndex: state.maskList.length));
    }
  }

  FutureOr<void> _showHideFilterList(
      ShowHideFilterListEvent event, Emitter<CameraState> emit) {
    print(event);
    bool isShow = !state.showFilterList;
    if (isShow) {
      emit(state.copyWith(
          showFilterList: isShow, showEffectList: false, showMaskList: false));
    } else {
      emit(state.copyWith(showFilterList: isShow));
    }
  }

  FutureOr<void> _showHideEffectList(
      ShowHideEffectListEvent event, Emitter<CameraState> emit) {
    bool isShow = !state.showEffectList;
    if (isShow) {
      emit(state.copyWith(
          showFilterList: false, showEffectList: isShow, showMaskList: false));
    } else {
      emit(state.copyWith(showEffectList: isShow));
    }
  }

  FutureOr<void> _showHideMaskList(
      ShowHideMaskListEvent event, Emitter<CameraState> emit) {
    bool isShow = !state.showMaskList;
    if (isShow) {
      emit(state.copyWith(
          showFilterList: false, showEffectList: false, showMaskList: isShow));
    } else {
      emit(state.copyWith(showMaskList: isShow));
    }
  }


  FutureOr<void> _toggleCapture(ToggleCaptureEvent event, Emitter<CameraState> emit) {
    emit(state.copyWith(captureState: event.captureState));
  }
}

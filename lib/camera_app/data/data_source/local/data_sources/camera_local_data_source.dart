import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fun_cam/core/utils/app_constant.dart';
import 'package:fun_cam/core/utils/enums.dart';

import '../../../model/ar_model.dart';

abstract class BaseCameraLocalDataSource {
  Future<List<ArModel>> getEffectsFromAssets();

  Future<List<ArModel>> getFiltersFromAssets();

  Future<List<ArModel>> getMasksFromAssets();
}

class CameraLocalDataSource extends BaseCameraLocalDataSource {
  @override
  Future<List<ArModel>> getEffectsFromAssets() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    print("manifestContent $manifestContent");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final filePaths = manifestMap.keys
        .where((path) => path.startsWith(AppConstant.assetEffectsPath))
        .toList();
    print(filePaths);
    List<ArModel> effectList = List<ArModel>.from(
      filePaths.map(
            (e) => ArModel(
            file: e,
            image: AppConstant.assetImagesPath(AppConstant.getImageName(e)),
            filterType: FilterType.effect),
      ),
    );
    // effectList.insert(0, const ArModel(file: "null", image: "assets/images/error.png", filterType: FilterType.effect));
    return effectList;

    // return filePaths;
  }

  @override
  Future<List<ArModel>> getFiltersFromAssets() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    print("manifestContent $manifestContent");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final filePaths = manifestMap.keys
        .where((path) => path.startsWith(AppConstant.assetFiltersPath))
        .toList();
    List<ArModel> filterList = List<ArModel>.from(
      filePaths.map(
            (e) => ArModel(
            file: e,
            image: AppConstant.assetImagesPath(AppConstant.getImageName(e)),
            filterType: FilterType.filter),
      ),
    );
    // filterList.insert(0, const ArModel(file: "null", image: "assets/images/error.png", filterType: FilterType.filter));
    return filterList;
  }

  @override
  Future<List<ArModel>> getMasksFromAssets() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    print("manifestContent $manifestContent");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final filePaths = manifestMap.keys
        .where((path) => path.startsWith(AppConstant.assetMasksPath))
        .toList();
    List<ArModel> maskList = List<ArModel>.from(
      filePaths.map(
            (e) => ArModel(
            file: e,
            image: AppConstant.assetImagesPath(AppConstant.getImageName(e)),
            filterType: FilterType.mask),
      ),
    );
    // maskList.insert(0, const ArModel(file: "null", image: "assets/images/error.png", filterType: FilterType.effect));
    return maskList;
  }
}

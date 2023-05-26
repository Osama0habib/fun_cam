
import 'package:fun_cam/camera_app/data/repositories/ar_repository.dart';
import 'package:fun_cam/camera_app/domain/repositories/base_ar_repository.dart';
import 'package:fun_cam/camera_app/domain/use_cases/get_effects_from_assets_usecase.dart';
import 'package:fun_cam/camera_app/presentation/manager/camera_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../camera_app/data/data_source/local/data_sources/camera_local_data_source.dart';
import '../../camera_app/domain/use_cases/get_filters_from_assets_usecase.dart';
import '../../camera_app/domain/use_cases/get_masks_from_assets_usecase.dart';


final sl = GetIt.instance;
class ServiceLocator {
  void init(){
    /// Bloc
    sl.registerFactory(() => CameraBloc(sl(),sl(),sl()));


    /// Remote DataSource
    sl.registerLazySingleton<BaseCameraLocalDataSource>(() => CameraLocalDataSource());

    /// Movies Repository
    sl.registerLazySingleton<BaseArRepository>(() => ArRepository(sl()));

    /// Usecases
    sl.registerLazySingleton(() => GetEffectsFromAssetsUseCase(sl()));
    sl.registerLazySingleton(() => GetFiltersFromAssetsUseCase(sl()));
    sl.registerLazySingleton(() => GetMasksFromAssetsUseCase(sl()));






  }
}
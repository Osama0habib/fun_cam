import 'package:dartz/dartz.dart';
import 'package:fun_cam/camera_app/data/model/ar_model.dart';
import 'package:fun_cam/camera_app/domain/repositories/base_ar_repository.dart';
import 'package:fun_cam/core/error/failure.dart';

import '../data_source/local/data_sources/camera_local_data_source.dart';

class ArRepository extends BaseArRepository {
  final BaseCameraLocalDataSource baseCameraLocalDataSource;

  ArRepository(this.baseCameraLocalDataSource);
  @override
  Future<Either<Failure, List<ArModel>>> getEffectsFromAssets() async {
    try {
      final result = await baseCameraLocalDataSource.getEffectsFromAssets();
      return Right(result);
    }catch (error){
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArModel>>> getFiltersFromAssets() async {
    try {
      final result = await baseCameraLocalDataSource.getFiltersFromAssets();
      return Right(result);
    }catch (error){
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArModel>>> getMasksFromAssets() async {
    try {
      final result = await baseCameraLocalDataSource.getMasksFromAssets();
      return Right(result);
    }catch (error){
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }




}
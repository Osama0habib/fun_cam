import 'package:dartz/dartz.dart';
import 'package:fun_cam/camera_app/data/model/ar_model.dart';

import '../../../core/error/failure.dart';

abstract class BaseArRepository {
  Future<Either<Failure,List<ArModel>>> getEffectsFromAssets();
  Future<Either<Failure,List<ArModel>>> getFiltersFromAssets();
  Future<Either<Failure,List<ArModel>>> getMasksFromAssets();


}
import 'package:dartz/dartz.dart';
import 'package:fun_cam/camera_app/domain/repositories/base_ar_repository.dart';
import 'package:fun_cam/core/base_usercase.dart';
import 'package:fun_cam/core/error/failure.dart';

import '../../data/model/ar_model.dart';

class GetFiltersFromAssetsUseCase extends BaseUseCase<List<ArModel>> {
  final BaseArRepository baseArRepository;

  GetFiltersFromAssetsUseCase(this.baseArRepository);
  @override
  Future<Either<Failure, List<ArModel>>> call() async {
    return await baseArRepository.getFiltersFromAssets();
  }



}
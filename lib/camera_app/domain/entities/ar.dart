import 'package:equatable/equatable.dart';
import 'package:fun_cam/core/utils/enums.dart';

class Ar extends Equatable {
  final String file;
  final String image;
  final FilterType filterType;

  const Ar({required this.file, required this.image,required this.filterType,});

  @override
  List<Object> get props => [file, image,filterType];
}
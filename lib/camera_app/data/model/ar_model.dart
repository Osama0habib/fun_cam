import '../../domain/entities/ar.dart';

class ArModel extends Ar {
  const ArModel({
    required super.file,
    required super.image,
    required super.filterType,
  });

  ArModel fromJson(Map<String, dynamic> json) {
    return ArModel(
        file: json["file"],
        image: json["image"],
        filterType: json["filter_type"]);
  }
}

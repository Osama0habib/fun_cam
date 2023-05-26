

import '../../camera_app/data/data_source/local/models/error_message_model.dart';

class ServerException implements Exception {

  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});

}

class LocalDatabaseException implements Exception {
  final String message;

 const LocalDatabaseException({required this.message});
}
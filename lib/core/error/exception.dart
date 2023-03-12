import '../network/eman_error_message_model.dart';

class EmanServerException implements Exception {
  final EmanErrorMessageModel emanErrorMessageModel;

  EmanServerException({
    required this.emanErrorMessageModel,
  });
}
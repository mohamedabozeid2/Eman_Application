import 'package:equatable/equatable.dart';

class EmanErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;

  const EmanErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
  });

  factory EmanErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return EmanErrorMessageModel(
      statusCode: json['code'],
      statusMessage: json['status'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusCode,
    statusMessage,
  ];
}

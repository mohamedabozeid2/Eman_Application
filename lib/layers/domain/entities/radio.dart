import 'package:equatable/equatable.dart';

class RadioEntity extends Equatable {
  final int id;
  final String name;
  final String url;

  const RadioEntity({
    required this.url,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        url,
        id,
        name,
      ];
}

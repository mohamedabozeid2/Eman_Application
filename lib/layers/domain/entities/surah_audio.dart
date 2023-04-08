import 'package:equatable/equatable.dart';

class SurahAudio extends Equatable {
  final String audioUrl;
  final int id;

  const SurahAudio({
    required this.id,
    required this.audioUrl,
  });

  @override
  List<Object?> get props => [
        audioUrl,
        id,
      ];
}

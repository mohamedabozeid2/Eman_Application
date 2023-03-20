import 'package:eman_application/features/domain/entities/surah_audio.dart';

class SurahAudioModel extends SurahAudio {
  const SurahAudioModel({
    required super.id,
    required super.audioUrl,
  });

  factory SurahAudioModel.fromJson(Map<String, dynamic> json) {
    return SurahAudioModel(
      id: json['id'],
      audioUrl: json['audio_url'],
    );
  }
}

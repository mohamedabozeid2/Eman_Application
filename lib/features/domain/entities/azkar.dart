import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../data/models/single_azkar_model.dart';

part 'azkar.g.dart';

@HiveType(typeId: 5)
class AzkarEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final List<SingleAzkar> azkarSbah;
  @HiveField(1)
  final List<SingleAzkar> azkarMsaa;
  @HiveField(2)
  final List<SingleAzkar> azkarAfterSalah;
  @HiveField(3)
  final List<SingleAzkar> tsapeh;
  @HiveField(4)
  final List<SingleAzkar> azkarBeforSleep;
  @HiveField(5)
  final List<SingleAzkar> azkarAfterSleep;
  @HiveField(6)
  final List<SingleAzkar> azkarQuran;
  @HiveField(7)
  final List<SingleAzkar> prophetsWords;

  AzkarEntity({
    required this.azkarAfterSalah,
    required this.azkarAfterSleep,
    required this.azkarBeforSleep,
    required this.azkarMsaa,
    required this.azkarQuran,
    required this.azkarSbah,
    required this.prophetsWords,
    required this.tsapeh,
  });

  @override
  List<Object?> get props => [
        azkarSbah,
        azkarMsaa,
        azkarAfterSleep,
        azkarBeforSleep,
        azkarAfterSalah,
        azkarQuran,
        prophetsWords,
        tsapeh,
      ];
}

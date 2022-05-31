import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'daily_habbit.g.dart';

@HiveType(typeId: 1)
class Habbit {
  @HiveField(0)
  final String habbit;
 
  @HiveField(1)
  bool finished;

  Habbit({required this.habbit, required this.finished});
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'dayli_habbit.g.dart';

@HiveType(typeId: 1)
class Habbit {
  @HiveField(0)
  final String habbit;
  @HiveField(1)
  final int id;
  @HiveField(2)
  bool finished;

  Habbit({required this.habbit, required this.id, required this.finished});
}

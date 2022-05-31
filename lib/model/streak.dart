import 'package:hive/hive.dart';

part 'streak.g.dart';

@HiveType(typeId: 2)
class Streak extends HiveObject {
  @HiveField(0)
  final int lenght;
  @HiveField(1)
  final DateTime lastEdit;

  Streak({required this.lenght, required this.lastEdit});
}

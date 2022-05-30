import 'package:habit_tracker/model/dayli_habbit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'mood_day.g.dart';

@HiveType(typeId: 0)
class MoodDay extends HiveObject {
  /*
  -> Relaxed
  -> Bored
  -> Grateful
  -> Angry
  */
  @HiveField(0)
  final String feeling;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  List<Habbit> habbits;

  MoodDay({required this.feeling, required this.date, required this.habbits});
}

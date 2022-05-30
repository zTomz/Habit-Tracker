// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodDayAdapter extends TypeAdapter<MoodDay> {
  @override
  final int typeId = 0;

  @override
  MoodDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodDay(
      feeling: fields[0] as String,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MoodDay obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.feeling)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

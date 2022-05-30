// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayli_habbit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabbitAdapter extends TypeAdapter<Habbit> {
  @override
  final int typeId = 1;

  @override
  Habbit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habbit(
      habbit: fields[0] as String,
      id: fields[1] as int,
      finished: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Habbit obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.habbit)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.finished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabbitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_joke_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveJokeModelAdapter extends TypeAdapter<HiveJokeModel> {
  @override
  final int typeId = 0;

  @override
  HiveJokeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveJokeModel(
      categories: (fields[0] as List).cast<String>(),
      createdAt: fields[1] as String,
      iconUrl: fields[2] as String,
      id: fields[3] as String,
      updatedAt: fields[4] as String,
      url: fields[5] as String,
      value: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveJokeModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.iconUrl)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveJokeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

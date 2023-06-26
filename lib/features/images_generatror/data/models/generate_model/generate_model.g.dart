// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenerateModelAdapter extends TypeAdapter<GenerateModel> {
  @override
  final int typeId = 0;

  @override
  GenerateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenerateModel(
      prompt: fields[0] as String,
      size: fields[1] as String,
      images: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GenerateModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.prompt)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenerateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskModal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModalAdapter extends TypeAdapter<TaskModal> {
  @override
  final int typeId = 1;

  @override
  TaskModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModal(
      taskName: fields[0] as dynamic,
      isDone: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

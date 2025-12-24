// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatHiveAdapter extends TypeAdapter<ChatHive> {
  @override
  final typeId = 0;

  @override
  ChatHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatHive(
      chatTitle: fields[0] as String,
      messages: (fields[1] as List?)?.cast<MessageHive>(),
      chatId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChatHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.chatTitle)
      ..writeByte(1)
      ..write(obj.messages)
      ..writeByte(2)
      ..write(obj.chatId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessageHiveAdapter extends TypeAdapter<MessageHive> {
  @override
  final typeId = 1;

  @override
  MessageHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageHive(
      imageUrl: fields[0] as String?,
      text: fields[1] as String?,
      isUser: fields[2] as bool?,
      imageFile: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MessageHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isUser)
      ..writeByte(3)
      ..write(obj.imageFile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

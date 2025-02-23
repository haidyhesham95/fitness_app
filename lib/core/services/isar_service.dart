import 'package:fitness_app/features/smart_coach_chat/data/models/offline/chat_isar.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

@module
abstract class IsarModule {
  @preResolve
  Future<Isar> get isarProvider async {
    final Directory directory = await getApplicationSupportDirectory();
    return Isar.open([MessageIsarSchema, ChatIsarSchema], directory: directory.path);
  }
}
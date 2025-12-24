import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<ChatHive>> get chatBoxProvider async {
    final Directory directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);
    
    // Register adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ChatHiveAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MessageHiveAdapter());
    }
    
    return await Hive.openBox<ChatHive>('chatBox');
  }
}

import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_ce/hive.dart';

class HiveDebugHelper {
  /// debugPrint all chats stored in Hive
  static Future<void> printAllChats() async {
    try {
      final box = await Hive.openBox<ChatHive>('chatBox');
      
      debugPrint('====== HIVE DEBUG INFO ======');
      debugPrint('Box name: chatBox');
      debugPrint('Total chats stored: ${box.length}');
      debugPrint('Is box empty: ${box.isEmpty}');
      debugPrint('Box keys: ${box.keys.toList()}');
      debugPrint('============================');
      
      if (box.isNotEmpty) {
        debugPrint('\n====== CHAT DETAILS ======');
        for (var entry in box.toMap().entries) {
          final chat = entry.value;
          debugPrint('\n--- Chat ID: ${entry.key} ---');
          debugPrint('Chat Title: ${chat.chatTitle}');
          debugPrint('Total Messages: ${chat.messages?.length ?? 0}');
          
          if (chat.messages != null && chat.messages!.isNotEmpty) {
            debugPrint('Messages:');
            for (int i = 0; i < chat.messages!.length; i++) {
              final msg = chat.messages![i];
              debugPrint('  [$i] ${msg.isUser == true ? "User" : "AI"}: ${msg.text ?? msg.imageUrl ?? "Image"}');
            }
          }
          debugPrint('-------------------------');
        }
        debugPrint('==========================\n');
      } else {
        debugPrint('\n⚠️ No chats found in Hive box!\n');
      }
      
    } catch (e) {
      debugPrint('❌ Error reading Hive box: $e');
    }
  }
  
  /// Get total number of chats
  static Future<int> getTotalChats() async {
    try {
      final box = await Hive.openBox<ChatHive>('chatBox');
      return box.length;
    } catch (e) {
      debugPrint('Error getting total chats: $e');
      return 0;
    }
  }
  
  /// Check if Hive is working properly
  static Future<bool> testHiveConnection() async {
    try {
      final box = await Hive.openBox<ChatHive>('chatBox');
      debugPrint('✅ Hive box opened successfully');
      debugPrint('✅ Box path: ${box.path}');
      return true;
    } catch (e) {
      debugPrint('❌ Failed to open Hive box: $e');
      return false;
    }
  }
  
  /// Clear all data (for testing)
  static Future<void> clearAllData() async {
    try {
      final box = await Hive.openBox<ChatHive>('chatBox');
      await box.clear();
      debugPrint('✅ All Hive data cleared');
    } catch (e) {
      debugPrint('❌ Error clearing Hive data: $e');
    }
  }
}

import 'package:fitness_app/core/services/hive_debug_helper.dart';
import 'package:fitness_app/features/smart_coach_chat/data/models/offline/message_hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class HiveDebugScreen extends StatefulWidget {
  const HiveDebugScreen({super.key});

  @override
  State<HiveDebugScreen> createState() => _HiveDebugScreenState();
}

class _HiveDebugScreenState extends State<HiveDebugScreen> {
  List<ChatHive> chats = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      // Print to console
      await HiveDebugHelper.printAllChats();
      
      // Load chats
      final box = await Hive.openBox<ChatHive>('chatBox');
      setState(() {
        chats = box.values.toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Debug - Chat Data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : chats.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No chats found in Hive',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Try sending some messages in Smart Coach Chat',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chat = chats[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ExpansionTile(
                            title: Text(
                              chat.chatTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Chat ID: ${chat.chatId} | Messages: ${chat.messages?.length ?? 0}',
                            ),
                            children: [
                              if (chat.messages != null && chat.messages!.isNotEmpty)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: chat.messages!.length,
                                  itemBuilder: (context, msgIndex) {
                                    final msg = chat.messages![msgIndex];
                                    return ListTile(
                                      leading: CircleAvatar(
                                        child: Text(
                                          msg.isUser == true ? 'U' : 'AI',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      title: Text(
                                        msg.text ?? msg.imageUrl ?? 'Image',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        'Type: ${msg.text != null ? "Text" : "Image"}',
                                      ),
                                    );
                                  },
                                ),
                              if (chat.messages == null || chat.messages!.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'No messages in this chat',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          HiveDebugHelper.printAllChats();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Check console for detailed output'),
            ),
          );
        },
        label: const Text('Print to Console'),
        icon: const Icon(Icons.print),
      ),
    );
  }
}

import 'package:isar/isar.dart';

part 'message_isar.g.dart';

@Collection()
class MessageIsar {
  Id id = Isar.autoIncrement;
  String? imageUrl;
  late String text;
  late bool isUser;

  MessageIsar({this.imageUrl, required this.text, required this.isUser});
}
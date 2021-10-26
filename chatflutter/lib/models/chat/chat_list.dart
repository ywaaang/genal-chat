import 'package:boilerplate/models/chat/chat.dart';

class ChatList {
  final List<Chat>? chats;

  ChatList({
    this.chats,
  });

  factory ChatList.fromJson(List<dynamic> json) {
    List<Chat> chats = <Chat>[];
    chats = json.map((chat) => Chat.fromMap(chat)).toList();

    return ChatList(
      chats: chats,
    );
  }
}

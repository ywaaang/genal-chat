import 'package:boilerplate/models/chat/message.dart';

class Chat {
  String? avatar;
  String? createTime;
  String? role;
  String? status;
  String? tag;
  String? userId;
  List<Message>? messages;

  Chat({
    this.avatar,
    this.createTime,
    this.role,
    this.status,
    this.tag,
    this.userId,
    this.messages,
  });

  factory Chat.fromMap(Map<String, dynamic> json) => Chat(
        avatar: json["avatar"],
        createTime: json["createTime"],
        role: json["role"],
        status: json["status"],
        tag: json["tag"],
        userId: json["userId"],
        messages: json["messages"],
      );

  Map<String, dynamic> toMap() => {
        "avatar": avatar,
        "createTime": createTime,
        "role": role,
        "status": status,
        "tag": tag,
        "userId": userId,
        "messages": messages,
      };
}

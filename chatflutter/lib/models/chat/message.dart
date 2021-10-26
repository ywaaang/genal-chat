import 'package:sembast/timestamp.dart';

class Message {
  String? content;
  String? friendId;
  String? messageType;
  Timestamp? time;
  String? userId;

  Message({
    this.content,
    this.friendId,
    this.messageType,
    this.time,
    this.userId,
  });
}

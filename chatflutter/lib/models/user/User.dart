class User {
  User({
    this.userId,
    this.username,
    this.avatar,
    this.role,
    this.status,
    this.tag,
    this.createTime,
    this.password,
  });

  String? userId;
  String? username;
  String? avatar;
  String? role;
  String? status;
  String? tag;
  int? createTime;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        username: json["username"],
        avatar: json["avatar"],
        role: json["role"],
        status: json["status"],
        tag: json["tag"],
        createTime: json["createTime"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "avatar": avatar,
        "role": role,
        "status": status,
        "tag": tag,
        "createTime": createTime,
        "password": password,
      };
}

import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/ui/chat/chat.dart';
import 'package:boilerplate/ui/message/message.dart';
import 'package:boilerplate/ui/user/user.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String message = '/message';
  static const String user = '/user';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    chat: (BuildContext context) => ChatScreen(),
    message: (BuildContext context) => MessageScreen(),
    user: (BuildContext context) => UserScreen(),
  };
}

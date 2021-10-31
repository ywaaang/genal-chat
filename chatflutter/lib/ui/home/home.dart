import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boilerplate/ui/chat/chat.dart';
import 'package:boilerplate/ui/user/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;
  int _currentIndex = 0;
  List screenList = [
    ChatScreen(),
    UserScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: this.screenList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: this._currentIndex,
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            items: [
              _bottomNavigationBarItem(
                  Icons.message_sharp, Icons.message_outlined, "聊天"),
              _bottomNavigationBarItem(Icons.supervisor_account_sharp,
                  Icons.supervisor_account_outlined, "好友"),
              _bottomNavigationBarItem(
                  Icons.settings_sharp, Icons.settings_outlined, "设置"),
            ]));
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData activeIcon, IconData inactiveIcon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(inactiveIcon), // 图标
      activeIcon: Icon(activeIcon), // 高亮图标
      label: "$title", // 标题
      backgroundColor:
          Colors.yellow, // 背景色，仅在 BottomNavigatinBar 中生效，在 iOS 风格组件中无效
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(AppLocalizations.of(context).translate('home_tv_posts')),
    );
  }
}

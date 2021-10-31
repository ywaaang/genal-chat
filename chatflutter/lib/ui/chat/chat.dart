import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/chat/chat_store.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:boilerplate/models/argument/message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;
  late ChatStore _chatStore;
  late FormStore _formStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _formStore = Provider.of<FormStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return Material(child: _buildChatScreen());
      },
    );
  }

  List chatList = [
    {
      "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
      "username": "guest1",
      "avatar": "api/avatar/avatar(14).png",
      "role": "user",
      "status": "on",
      "tag": "",
      "createTime": 1634624207103,
      "messages": [
        {
          "_id": 1,
          "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "friendId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "content": "你好",
          "messageType": "text",
          "time": 1634626147017
        },
        {
          "_id": 2,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "你也好",
          "messageType": "text",
          "time": 1634626152847
        },
        {
          "_id": 3,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "hi",
          "messageType": "text",
          "time": 1634638163802
        }
      ]
    },
    {
      "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
      "username": "guest2",
      "avatar": "api/avatar/avatar(14).png",
      "role": "user",
      "status": "on",
      "tag": "",
      "createTime": 1634624207103,
      "messages": [
        {
          "_id": 1,
          "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "friendId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "content": "你好",
          "messageType": "text",
          "time": 1634626147017
        },
        {
          "_id": 2,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "你也好",
          "messageType": "text",
          "time": 1634626152847
        },
        {
          "_id": 3,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "hi",
          "messageType": "text",
          "time": 1634638163802
        }
      ]
    },
    {
      "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
      "username": "guest3",
      "avatar": "api/avatar/avatar(14).png",
      "role": "user",
      "status": "on",
      "tag": "",
      "createTime": 1634624207103,
      "messages": [
        {
          "_id": 1,
          "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "friendId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "content": "你好",
          "messageType": "text",
          "time": 1634626147017
        },
        {
          "_id": 2,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "你也好",
          "messageType": "text",
          "time": 1634626152847
        },
        {
          "_id": 3,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "hi",
          "messageType": "text",
          "time": 1634638163802
        }
      ]
    },
    {
      "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
      "username": "guest4",
      "avatar": "api/avatar/avatar(14).png",
      "role": "user",
      "status": "on",
      "tag": "",
      "createTime": 1634624207103,
      "messages": [
        {
          "_id": 1,
          "userId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "friendId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "content": "你好",
          "messageType": "text",
          "time": 1634626147017
        },
        {
          "_id": 2,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "你也好",
          "messageType": "text",
          "time": 1634626152847
        },
        {
          "_id": 3,
          "userId": "4daecb9b-2019-41a7-b041-44e8f3a7fe23",
          "friendId": "c6079758-6fc7-4d4d-ac7a-4e499453b92f",
          "content": "hi",
          "messageType": "text",
          "time": 1634638163802
        }
      ]
    }
  ];

  // General Methods:-----------------------------------------------------------
  Widget _buildChatScreen() {
    return Observer(builder: (context) {
      return new Material(
          child: ListView.separated(
        separatorBuilder: (context, position) {
          return Divider();
        },
        itemBuilder: (context, position) {
          return _buildChatList(position);
        },
        itemCount: chatList.length,
      ));
    });
  }

  Widget _buildChatList(int position) {
    return new ListTile(
      dense: true,
      leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.bq233.com%2Fkanqq%2Fpic%2Fupload%2F2018%2F0807%2F1533622762937587.jpg&refer=http%3A%2F%2Fimg.bq233.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1637649963&t=a7e05c87ef557475273441777c488672')),
          )),
      onTap: () {
        // Navigator.of(context).pushNamed(Routes.message,
        //     arguments: MessageArgs(chatList[position]!['username'],
        //         chatList[position]!['userId']));
        print(_formStore.isLoggedIn);
      },
      title: Text(
        chatList[position]!['username'],
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: new TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '你好呀',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}

/// 原生
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 第三方
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:boilerplate/widgets/message_bubble.dart';
import 'package:boilerplate/widgets/icon_font.dart';
import 'package:boilerplate/models/argument/message.dart';

//气球聊天详情页
class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  /// 用户头像
  Widget userAvatar(img, size) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.bq233.com%2Fkanqq%2Fpic%2Fupload%2F2018%2F0807%2F1533622762937587.jpg&refer=http%3A%2F%2Fimg.bq233.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1637649963&t=a7e05c87ef557475273441777c488672'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MessageArgs;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: KeyboardVisibilityBuilder(
          /// 检测键盘是否弹出
          builder: (context, isKeyboardVisible) {
            if (isKeyboardVisible) {
              /// 当键盘弹出时自动跳转到最底部
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            }
            return GestureDetector(
                onTap: () => {
                      hideKeyboard(context),

                      /// 隐藏键盘
                      emojiShowing = false
                    },
                child: Scaffold(
                    backgroundColor: Colors.lightBlue.shade50,
                    appBar: new AppBar(
                      title: Text(args.title),
                    ),
                    body: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: _chatList(context),
                    )));
          },
        ));
  }

  /// 通用获取安全顶部距离
  Widget safePadding(BuildContext context, color) {
    return Container(
      height: MediaQuery.of(context).padding.top,
      color: color,
    );
  }

  /// 隐藏键盘
  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  ScrollController scrollController = ScrollController();

  /// 消息列表
  var _messageList = [
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
  ];

  /// 判断是否首次进入页面
  var firstCome = true;

  /// 输入框焦点
  FocusNode focusNode = new FocusNode();

  var _visZhifeiji = true; //发送按钮隐藏和显示
  bool _isText = true; //true文本输入  false语言输入
  final TextEditingController _messageText =
      new TextEditingController(); // 需要初始化的时候赋值用
  bool emojiShowing = false; // 是否显示表情
  bool keyboardShowing = false; // 是否显示键盘

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        keyboardShowing = true;
        if (emojiShowing) {
          setState(() {
            emojiShowing = !emojiShowing;
          });
        }
      } else {
        keyboardShowing = false;
      }
    });

    super.initState();
  }

  ///选中表情
  _onEmojiSelected(Emoji emoji) {
    _visZhifeiji = false;
    _messageText
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _messageText.text.length));
  }

  ///表情删除按钮
  _onBackspacePressed() {
    _messageText
      ..text = _messageText.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _messageText.text.length));
    if (_messageText.text.length == 0) {
      _visZhifeiji = true;
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// 渲染聊天内容
  next(_messageRealList, index, userId) {
    return Row(
      children: [
        _messageRealList[index]['userId'] == userId
            ? Expanded(child: Text(""))
            : userAvatar(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202005%2F06%2F20200506110929_iajqi.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631409536&t=03cad8232b224d6a7ff11f58ff2be920",
                58),
        GestureDetector(
          onTap: () => {},
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 128),
            child: Bubble(
                direction: _messageRealList[index]['userId'] == userId
                    ? BubbleDirection.right
                    : BubbleDirection.left,
                child: Text(
                  "${_messageRealList[index]['content']}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
        ),
        _messageRealList[index]['userId'] != userId
            ? Expanded(child: Text(""))
            : userAvatar(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fc8%2Fdd%2Fb9%2Fc8ddb934a69d90216f1b406cf3975475.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631409536&t=17150dcec9e325456525160928d384f7",
                58),
      ],
    );
  }

  /// 渲染聊天部分
  Widget _chatList(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MessageArgs;
    List<Map<dynamic, dynamic>> _messageRealList =
        _messageList.reversed.toList();
    if (scrollController.hasClients &&
        firstCome &&
        scrollController.position.maxScrollExtent != 0.0) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      firstCome = false;
    }
    return Column(
      children: [
        safePadding(context, Colors.transparent),
        Expanded(
          child: _messageList.length > 0
              ? EasyRefresh.custom(
                  scrollController: scrollController,
                  header: ClassicalHeader(),
                  onRefresh: () async {
                    /// 加载更多消息方法
                  },
                  slivers: [
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              next(_messageRealList, index, args.userId),
                          childCount: _messageList.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 312 / 60,
                        ),
                      )
                    ])
              : Text(""),
        ),

        ///输入键盘
        Container(
          color: Color(0x0dffffff),
          margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 13, 0),
                    width: 34,
                    height: 34,
                    child: _isText
                        ? Icon(IconFont.icon_voice)
                        : Icon(IconFont.icon_Keyboard)),
              ),
              Expanded(
                flex: 1,
                child: _isText
                    ? TextFormField(
                        focusNode: focusNode,
                        controller: _messageText,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: InputDecoration(
                            hintText: '请输入',
                            hintStyle: TextStyle(
                                fontSize: 18, color: Color(0x80ffffff))),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            _visZhifeiji = true;
                          } else {
                            _visZhifeiji = false;
                          }
                        },
                      )
                    : Text("data", style: TextStyle(color: Colors.white)),
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 6, 0),
                  width: 30,
                  height: 30,
                  child: Icon(IconFont.icon_emoji),
                ),
                onTap: () {
                  hideKeyboard(context);
                  Future.delayed(Duration(milliseconds: 10), () {
                    setState(() {
                      emojiShowing = !emojiShowing;
                    });
                    if (emojiShowing) {
                      scrollController.jumpTo(
                          scrollController.position.maxScrollExtent + 250);
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(6, 0, 15, 0),
                  width: 34,
                  height: 34,
                  child: Icon(IconFont.icon_add),
                ),
                // onTap:(){
                // _onImageButtonPressed(ImageSource.camera, context: context);//打开相机
                // }
              ),
              Offstage(
                  offstage: _visZhifeiji,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    width: 32.0,
                    height: 32.0,
                    child: InkWell(
                      child: Icon(IconFont.icon_Sendmessage),
                      onTap: () {
                        _visZhifeiji = true;
                        // this.getHistoryMessages();
                        _messageText.text = "";
                      },
                    ),
                  ))
            ],
          ),
        ),

        ///表情
        Offstage(
          offstage: !emojiShowing,
          child: SizedBox(
            height: 250,
            width: 1000,
            child: EmojiPicker(
                onEmojiSelected: (Category category, Emoji emoji) {
                  _onEmojiSelected(emoji);
                },
                onBackspacePressed: _onBackspacePressed,
                config: const Config(
                    columns: 7,
                    emojiSizeMax: 25.0,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    initCategory: Category.RECENT,
                    bgColor: Color(0xFFF2F2F2),
                    indicatorColor: Color(0xff65DAC5),
                    iconColor: Colors.orange,
                    iconColorSelected: Color(0xff65DAC5),
                    progressIndicatorColor: Color(0xff65DAC5),
                    backspaceColor: Color(0xff65DAC5),
                    showRecentsTab: true,
                    recentsLimit: 28,
                    noRecentsText: 'No Recents',
                    noRecentsStyle:
                        TextStyle(fontSize: 20, color: Colors.black26),
                    categoryIcons: CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL)),
          ),
        )
      ],
    );
  }
}

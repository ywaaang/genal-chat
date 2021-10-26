import 'package:flutter/material.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/models/argument/message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MessageArgs;
    return new Scaffold(
      appBar: new AppBar(
        title: Text(args.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new ListView(children: _buildMessageList());
  }

  List<Widget> _buildMessageList() {
    return [
      new Column(children: [Text('你好啊'), Text('2020-12-30')])
    ];
  }
}

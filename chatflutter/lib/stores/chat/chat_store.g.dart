// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  final _$chatListAtom = Atom(name: '_ChatStore.chatList');

  @override
  ChatList? get chatList {
    _$chatListAtom.reportRead();
    return super.chatList;
  }

  @override
  set chatList(ChatList? value) {
    _$chatListAtom.reportWrite(value, super.chatList, () {
      super.chatList = value;
    });
  }

  final _$friendDataAtom = Atom(name: '_ChatStore.friendData');

  @override
  ChatList? get friendData {
    _$friendDataAtom.reportRead();
    return super.friendData;
  }

  @override
  set friendData(ChatList? value) {
    _$friendDataAtom.reportWrite(value, super.friendData, () {
      super.friendData = value;
    });
  }

  @override
  String toString() {
    return '''
chatList: ${chatList},
friendData: ${friendData}
    ''';
  }
}

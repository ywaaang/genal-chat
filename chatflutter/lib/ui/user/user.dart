import 'package:flutter/material.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //stores:---------------------------------------------------------------------
  late FormStore _formStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _formStore = Provider.of<FormStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ElevatedButton(
                onPressed: () {
                  _formStore.logout();
                },
                child: Text('Logout'))));
  }
}

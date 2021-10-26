package com.iotecksolutions.todoapp;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    FlutterView view = getFlutterView();
    deepLinkChannel = new MethodChannel(view, "DEEPLINK");
  }
}

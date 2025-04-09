import 'package:flutter/material.dart';
import 'package:flutter_amap_window/amap_windows_webview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AMapWindowsWebView(apiKey: ''),
    );
  }
}

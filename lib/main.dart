import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewPage(),
    );
  }
}

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Инициализация WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Разрешение JavaScript
      ..loadRequest(Uri.parse('https://makadamiy.onrender.com')); // Ваш URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Убираем AppBar
      body: WebViewWidget(controller: _controller), // Отображение WebView
    );
  }
}

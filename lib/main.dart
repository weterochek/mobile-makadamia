import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

bool isTestMode = false; // Флаг для тестового режима

void main() {
  isTestMode = false; // В реальной среде это будет false
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
    if (!isTestMode) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://makadamiy.onrender.com'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: isTestMode
          ? FakeWebViewWidget() // Используем заглушку в тестовом режиме
          : WebViewWidget(controller: _controller),
    );
  }
}

// Заглушка WebView для тестовой среды
class FakeWebViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('WebView заглушка для тестов'),
    );
  }
}

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makadamia/main.dart'; // Основной файл приложения
import 'package:webview_flutter/webview_flutter.dart'; // Для WebView, если используется

void main() {
  setUpAll(() {
    // Заглушка: Удаляем использование WebView.platform, чтобы избежать ошибок
    debugPrint("WebView mock initialized for testing");
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Запускаем приложение
    await tester.pumpWidget(MyApp());

    // Проверяем начальное состояние
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Нажимаем кнопку "+"
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Ждем завершения всех обновлений

    // Проверяем состояние после нажатия
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// Создаем заглушку WebView
class FakeWebViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('WebView заглушка для тестов'));
  }
}

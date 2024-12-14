import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makadamia/main.dart';

void main() {
  setUpAll(() {
    // Заглушка для платформы WebView. Убираем вызов WebView.platform
    debugPrint("WebView platform setup skipped for test environment");
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

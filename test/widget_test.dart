import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makadamia/counter_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    // Проверяем начальное состояние
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Нажимаем кнопку "+"
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Проверяем состояние после нажатия
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Загружаем CounterPage
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    // Проверяем, что начальное значение равно "0"
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Нажимаем кнопку "+"
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Проверяем, что значение увеличилось до "1"
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

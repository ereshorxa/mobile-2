import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('заметку можно добавить, изменить и удалить', (tester) async {
    await tester.pumpWidget(const NotesApp());

    await tester.enterText(find.byType(TextField), 'Моя заметка');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Сохранить'));
    await tester.pump();
    expect(find.text('Моя заметка'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).last, 'Изменённая заметка');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Сохранить').last);
    await tester.pumpAndSettle();
    expect(find.text('Изменённая заметка'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();
    expect(find.text('Изменённая заметка'), findsNothing);
  });
}

import 'package:contact_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Initialize FFI
  sqfliteFfiInit();
  databaseFactoryOrNull = databaseFactoryFfi;

  final floatingActionButton = find.ancestor(
      of: find.byIcon(Icons.add), matching: find.byType(FloatingActionButton));
  final submitButton = find.widgetWithText(ElevatedButton, 'Submit');
  final nameField = find.ancestor(
      of: find.text('Name'), matching: find.byType(TextFormField));
  final nomorField = find.ancestor(
      of: find.text('Phone'), matching: find.byType(TextFormField));

  testWidgets('check add contact success', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('No Contacts Yet.'), findsOneWidget);
    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle();

    await tester.enterText(nameField, 'M. Adji');
    await tester.enterText(nomorField, '0823877498734');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ListView, 'M. Adji'), findsOneWidget);
    expect(find.widgetWithText(ListView, '0823877498734'), findsOneWidget);
    expect(find.text('No Contacts Yet.'), findsNothing);
  });
}

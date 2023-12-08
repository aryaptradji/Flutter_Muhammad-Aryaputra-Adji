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

  testWidgets('find title', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('My Contacts'), findsOneWidget);
    expect(find.byIcon(Icons.perm_contact_calendar_sharp), findsOneWidget);
  });

  testWidgets('find text when no contacts added', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('No Contacts Yet.'), findsOneWidget);
  });

  testWidgets('find floating action button', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(floatingActionButton, findsOneWidget);
  });

  testWidgets('check floating action button works or not',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(floatingActionButton, findsOneWidget);
    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle();
    expect(find.text('Add Contact'), findsOneWidget);
  });
}

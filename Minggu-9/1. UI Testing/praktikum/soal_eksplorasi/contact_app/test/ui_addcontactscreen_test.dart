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

  testWidgets('find title appbar', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(
      find.widgetWithText(AppBar, 'Add Contact'),
      findsOneWidget,
    );
  });

  testWidgets("find 'choose photo', 'view', and 'delete' button",
      (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(
      find.ancestor(
        of: find.text('Choose Photo'),
        matching: find.byType(ElevatedButton),
      ),
      findsOneWidget,
    );
    expect(
      find.ancestor(
        of: find.text('View'),
        matching: find.byType(ElevatedButton),
      ),
      findsOneWidget,
    );
    expect(
      find.ancestor(
        of: find.text('Delete'),
        matching: find.byType(ElevatedButton),
      ),
      findsOneWidget,
    );
  });

  testWidgets('find name textfield', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(
      find.ancestor(
        of: find.text('Name'),
        matching: find.byType(TextFormField),
      ),
      findsOneWidget,
    );
    expect(
      find.ancestor(
        of: find.text('Insert Your Name'),
        matching: find.byType(TextFormField),
      ),
      findsOneWidget,
    );
  });

  testWidgets('find phone textfield', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(
      find.ancestor(
        of: find.text('Phone'),
        matching: find.byType(TextFormField),
      ),
      findsOneWidget,
    );
    expect(
      find.ancestor(
        of: find.text('+62 ...'),
        matching: find.byType(TextFormField),
      ),
      findsOneWidget,
    );
  });

  testWidgets('find submit button', (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
  });
}

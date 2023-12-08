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
      of: find.text('Nomor'), matching: find.byType(TextFormField));
  final editButton = find.descendant(
      of: find.byIcon(Icons.edit), matching: find.byType(IconButton));

  testWidgets('check nametextfield is already filled',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('No Contacts Yet.'), findsOneWidget);
    await tester.tap(floatingActionButton);
    await tester.pumpAndSettle();

    await tester.enterText(nameField, 'M. Adji');
    await tester.enterText(nomorField, '08238774987');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ListView, 'M. Adji'), findsOneWidget);
    expect(find.widgetWithText(ListView, '08238774987'), findsOneWidget);
    expect(find.text('No Contacts Yet.'), findsNothing);

    expect(editButton, findsOneWidget);

    // await tester.tap(find.ancestor(
    //     of: find.byIcon(Icons.edit), matching: find.byType(IconButton)));
    // await tester.pumpAndSettle();
    // expect(
    //     find.ancestor(of: find.text('Insert Your Name'), matching: nameField),
    //     findsNothing);
    // expect(find.ancestor(of: find.text('M. Adji'), matching: nameField),
    //     findsOneWidget);
    // expect(find.ancestor(of: find.text('+62 ...'), matching: nomorField),
    //     findsNothing);
    // expect(find.ancestor(of: find.text('0823877498734'), matching: nomorField),
    //     findsOneWidget);
  });
}

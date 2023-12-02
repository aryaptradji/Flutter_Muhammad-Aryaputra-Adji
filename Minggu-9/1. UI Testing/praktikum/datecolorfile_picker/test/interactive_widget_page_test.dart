import 'package:datecolorfile_picker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final selectDateButton = find.ancestor(
      of: find.text('Select Date'), matching: find.byType(ElevatedButton));
  final pickAColorButton = find.ancestor(
      of: find.text('Pick a Color'), matching: find.byType(ElevatedButton));
  final choosePhotoButton = find.ancestor(
      of: find.text('Choose Photo'), matching: find.byType(ElevatedButton));
  final viewPhotoButton = find.ancestor(
      of: find.text('View Photo'), matching: find.byType(ElevatedButton));

  testWidgets("find appbar title 'Interactive Widgets'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('Interactive Widgets'), findsOneWidget);
  });

  testWidgets("find text 'Date :'", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('Date :'), findsOneWidget);
  });

  testWidgets("find 'Select Date' button", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(selectDateButton, findsOneWidget);
  });

  testWidgets("button 'Select Date' works", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(selectDateButton);
    await tester.pump();

    final cancelButton = find.ancestor(
        of: find.text('Cancel'), matching: find.byType(TextButton));
    final okButton =
        find.ancestor(of: find.text('OK'), matching: find.byType(TextButton));
    expect(cancelButton, findsOneWidget);
    expect(okButton, findsOneWidget);

    await tester.tap(cancelButton);
    await tester.pump();
    expect(cancelButton, findsNothing);
    expect(okButton, findsNothing);

    await tester.tap(selectDateButton);
    await tester.pump();

    await tester.tap(okButton);
    await tester.pump();
    expect(cancelButton, findsNothing);
    expect(okButton, findsNothing);
  });

  testWidgets("find text 'Color :'", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('Color :'), findsOneWidget);
  });

  testWidgets("find 'Pick a Color' button", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(pickAColorButton, findsOneWidget);
  });

  testWidgets("button 'Pick a Color' works", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(pickAColorButton);
    await tester.pump();

    final saveButton = find.ancestor(
        of: find.text('Save'), matching: find.byType(ElevatedButton));
    final cancelButton = find.ancestor(
        of: find.text('Cancel'), matching: find.byType(TextButton));
    expect(saveButton, findsOneWidget);
    expect(cancelButton, findsOneWidget);

    await tester.tap(saveButton);
    await tester.pump();
    expect(saveButton, findsNothing);
    expect(cancelButton, findsNothing);
  });

  testWidgets("find circle container for display color",
      (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(
        ((tester.firstWidget(find.byType(Container)) as Container).decoration
                as BoxDecoration)
            .color,
        Colors.blue);
  });

  testWidgets("find text 'Photo :'", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(find.text('Photo :'), findsOneWidget);
  });

  testWidgets("find button 'Choose Photo'", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(choosePhotoButton, findsOneWidget);
  });

  testWidgets("button 'Choose Photo' works", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    await tester.tap(choosePhotoButton);
    await tester.pump();
  });

  testWidgets("find button 'View Photo'", (WidgetTester tester) async {
    await tester.pumpWidget(const Main());

    expect(viewPhotoButton, findsOneWidget);
  });
}

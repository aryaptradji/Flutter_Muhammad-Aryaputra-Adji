import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:contact_app/main.dart';

void main() {
  final nomorTextField = find.ancestor(
      of: find.text('Nomor'), matching: find.byType(TextFormField));
  final nameTextField = find.ancestor(
      of: find.text('Name'), matching: find.byType(TextFormField));
  final buttonSubmit =
      find.ancestor(of: find.text('Submit'), matching: find.byType(InkWell));

  testWidgets("find appbar title", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Contacts'), findsOneWidget);
  });

  testWidgets("find header text", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(
        find.text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.'),
        findsOneWidget);
  });

  testWidgets("find 2 textfields", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(TextFormField), findsNWidgets(2));
  });

  testWidgets("find name textfield", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(nameTextField, findsOneWidget);
  });

  testWidgets("find nomor textfield", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(nomorTextField, findsOneWidget);
  });

  testWidgets("find button submit", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(buttonSubmit, findsOneWidget);
  });

  testWidgets("find 'List Contact' title", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('List Contacts'), findsOneWidget);
  });

  testWidgets("fill name textfield", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'M. Adji');
    expect(find.text('M. Adji'), findsOneWidget);
  });

  testWidgets("fill nomor textfield", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nomorTextField, '08872878497248');
    expect(find.text('08872878497248'), findsOneWidget);
  });

  testWidgets(
      "find error text 'Nama wajib diisi' & 'Nomor handphone wajib diisi'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(buttonSubmit);
    await tester.pump();
    expect(find.text('Nama wajib diisi'), findsOneWidget);
    expect(find.text('Nomor handphone wajib diisi'), findsOneWidget);
  });

  testWidgets(
      "find error text 'Nama tidak boleh mengandung angka atau karakter khusus'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'Adji999');
    await tester.enterText(nomorTextField, '08872878497248');
    await tester.tap(buttonSubmit);
    await tester.pump();

    expect(find.text('Nama tidak boleh mengandung angka atau karakter khusus'),
        findsOneWidget);
  });

  testWidgets(
      "find error text 'Tiap kata dari nama harus diawali dengan Huruf Kapital'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'Muhammad adji');
    await tester.enterText(nomorTextField, '08872878497248');
    await tester.tap(buttonSubmit);
    await tester.pump();

    expect(find.text('Tiap kata dari nama harus diawali dengan Huruf Kapital'),
        findsOneWidget);
  });

  testWidgets("find error text 'Nama minimal terdiri dari 2 kata'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'Adji');
    await tester.enterText(nomorTextField, '08872878497248');
    await tester.tap(buttonSubmit);
    await tester.pump();

    expect(find.text('Nama minimal terdiri dari 2 kata'), findsOneWidget);
  });

  testWidgets("find error text 'Nomor handphone harus terdiri dari angka'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'M. Adji');
    await tester.enterText(nomorTextField, '089832847abc');
    await tester.tap(buttonSubmit);
    await tester.pump();

    expect(
        find.text('Nomor handphone harus terdiri dari angka'), findsOneWidget);
  });

  testWidgets("find error text 'Nomor handphone harus dimulai dengan angka 0'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'M. Adji');
    await tester.enterText(nomorTextField, '1234556789');
    await tester.tap(buttonSubmit);
    await tester.pump();

    expect(find.text('Nomor handphone harus dimulai dengan angka 0'),
        findsOneWidget);
  });

  testWidgets(
      "find error text 'Panjang nomor handphone terdiri dari 8-15 digit'",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'M. Adji');
    await tester.enterText(nomorTextField, '0812');
    await tester.tap(buttonSubmit);
    await tester.pump();

    expect(find.text('Panjang nomor handphone terdiri dari 8-15 digit'),
        findsOneWidget);
  });

  testWidgets("add new contact success", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(nameTextField, 'M. Aryaputra Adji');
    await tester.enterText(nomorTextField, '082879374834');
    await tester.tap(buttonSubmit);
    await tester.pump();

    final listTileName = find.ancestor(
        of: find.text('M. Aryaputra Adji'), matching: find.byType(ListTile));
    expect(listTileName, findsOneWidget);
    final listTileNomor = find.ancestor(
        of: find.text('082879374834'), matching: find.byType(ListTile));
    expect(listTileNomor, findsOneWidget);
  });
}

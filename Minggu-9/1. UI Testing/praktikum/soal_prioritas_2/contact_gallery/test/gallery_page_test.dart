import 'package:contact_gallery/page/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('find appbar title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GalleryPage(),
      ),
    );

    expect(find.text('Gallery Image'), findsOneWidget);
  });

  testWidgets('find filter category', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GalleryPage(),
      ),
    );

    expect(find.text('Green Mountain'), findsOneWidget);
    expect(find.text('Aurora Mountain'), findsOneWidget);
    expect(find.text('Winter Mountain'), findsOneWidget);
  });

  testWidgets('find gridview picture gallery', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GalleryPage(),
      ),
    );

    final gridView = find.byType(GridView);
    expect(gridView, findsOneWidget);
  });

  testWidgets('check drawer works', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
      MaterialApp(
          home: GalleryPage(
        scaffoldKey: scaffoldKey,
      )),
    );

    scaffoldKey.currentState?.openDrawer();
    await tester.pump();

    expect(find.text('Pick a Page'), findsOneWidget);
  });

  testWidgets('image container can show modalbottomsheet',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GalleryPage(),
      ),
    );

    final imageContainer = find.ancestor(
      of: find.widgetWithImage(
        GestureDetector,
        AssetImage(imageGallery[0].assets),
      ),
      matching: find.byType(Container),
    );
    await tester.tap(imageContainer);
    await tester.pump();

    expect(
      find.image(
        AssetImage(imageGallery[0].assets),
      ),
      findsNWidgets(2),
    );
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Video Player', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(VPlayer(
      videoName: "ava",
      imageURL: 'imageURL',
    ));
    var title = find.byType(Text);
    expect(title, findsOneWidget);
    // Verify that our counter starts at 0.
    expect(find.text("ava"), findsOneWidget);

    //await tester.pump();
  });
}

/*
 * Created by andii on 12/11/21 23.01
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 12/11/21 22.59
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laporhoax/presentation/pages/static/tutorial_page.dart';

void main() {
  testWidgets('Page should display tutorial page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TutorialPage()));

    final item = find.byType(ListView);
    expect(item, findsOneWidget);
  });
}

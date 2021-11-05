import 'package:core/utils/state_enum.dart';
import 'package:feed/presentation/provider/feed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_page_test.mocks.dart';


@GenerateMocks([FeedNotifier])
void main() {
  late MockFeedNotifier mockFeedNotifier;

  setUp(() {
    mockFeedNotifier = MockFeedNotifier();
  });

  /*TODO INCREMENTAL TESTING
  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<FeedNotifier>.value(
      value: mockFeedNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }*/

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockFeedNotifier.feedState).thenReturn(RequestState.loading);

    //final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);
    //expect(progressFinder, findsOneWidget);
  });
}
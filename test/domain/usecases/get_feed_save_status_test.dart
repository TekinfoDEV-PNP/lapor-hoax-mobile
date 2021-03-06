/*
 * Created by andii on 12/11/21 23.01
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 12/11/21 22.56
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:laporhoax/domain/usecases/get_feed_save_status.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetFeedSaveStatus usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetFeedSaveStatus(mockRepository);
  });

  test('should get feed saving status from repository', () async {
    // arrange
    when(mockRepository.isAddedToSavedFeed(1)).thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}

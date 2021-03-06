/*
 * Created by andii on 12/11/21 23.01
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 12/11/21 22.56
 */

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laporhoax/domain/usecases/delete_report.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late DeleteReport usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = DeleteReport(mockRepository);
  });

  final tId = 1;
  final token = 'token';

  test('should delete item given', () async {
    // arrange
    when(mockRepository.deleteReport(token, tId))
        .thenAnswer((_) async => Right('success'));
    // act
    final result = await usecase.execute(token, tId);
    // asssert
    expect(result, Right('success'));
  });
}

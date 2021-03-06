/*
 * Created by andii on 12/11/21 23.01
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 12/11/21 23.01
 */

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laporhoax/domain/usecases/get_password_reset.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPasswordReset usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetPasswordReset(mockRepository);
  });

  final tEmail = 'email';

  test('should get success callback of feeds when execute function is called',
          () async {
        // arrange
        when(mockRepository.getPasswordReset(tEmail))
            .thenAnswer((_) async => Right('success'));
        // act
        final result = await usecase.execute(tEmail);
        // assert
        expect(result, Right('success'));
      });
}

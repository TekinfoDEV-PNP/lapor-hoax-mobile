/*
 * Created by andii on 17/11/21 00.28
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 16/11/21 23.58
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:laporhoax/data/datasources/local_data_source.dart';
import 'package:laporhoax/domain/entities/session_data.dart';
import 'package:laporhoax/utils/exception.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late LocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;
  late MockPreferencesHelper mockPreferencesHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    mockPreferencesHelper = MockPreferencesHelper();
    dataSource = LocalDataSourceImpl(
      databaseHelper: mockDatabaseHelper,
      preferencesHelper: mockPreferencesHelper,
    );
  });

  group('Insert Feed', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertNews(testFeedTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertFeed(testFeedTable);
      // assert
      expect(result, 'Feed Saved');
    });

    test('should throw DatabaseException when insert to database is failed',
        () {
      // arrange
      when(mockDatabaseHelper.insertNews(testFeedTable)).thenThrow(Exception());
      // act
      final call = dataSource.insertFeed(testFeedTable);
      // assert
      expect(call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Remove Feed', () {
    test('should return success message when remove to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeFeed(testFeedTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeFeed(testFeedTable);
      // assert
      expect(result, 'Feed Removed');
    });

    test('should throw DatabaseException when insert to database is failed',
        () {
      // arrange
      when(mockDatabaseHelper.removeFeed(testFeedTable)).thenThrow(Exception());
      // act
      final call = dataSource.removeFeed(testFeedTable);
      // assert
      expect(call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Feed Detail By Id', () {
    final tId = 1;

    test('should return Feed Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getFeedById(tId))
          .thenAnswer((_) async => testFeedMap);
      // act
      final result = await dataSource.getFeedById(tId);
      // assert
      expect(result, testFeedTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getFeedById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getFeedById(tId);
      // assert
      expect(result, null);
    });
  });

  group('Get Feed Lists', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getFeeds())
          .thenAnswer((_) async => [testFeedMap]);
      // act
      final result = await dataSource.getFeeds();
      // assert
      expect(result, [testFeedTable]);
    });
  });

  group('cache categories', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCategoryCache()).thenAnswer((_) async => 1);
      // act
      await dataSource.cacheCategory([testCategoryTable]);
      // assert
      verify(mockDatabaseHelper.clearCategoryCache());
      verify(mockDatabaseHelper.insertCategoryTransaction([testCategoryTable]));
    });

    test('should return list of categories when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCategoryCache())
          .thenAnswer((_) async => [testCategoryMap]);
      // act
      final result = await dataSource.getCachedCategory();
      // assert
      expect(result, [testCategoryTable]);
    });

    test('should throw CacheException when data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCategoryCache()).thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedCategory();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('cache questions', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearQuestionCache()).thenAnswer((_) async => 1);
      // act
      await dataSource.cacheQuestions([testQuestionTable]);
      // assert
      verify(mockDatabaseHelper.clearQuestionCache());
      verify(mockDatabaseHelper.insertQuestionTransaction([testQuestionTable]));
    });

    test('should return list of categories when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getQuestionCache())
          .thenAnswer((_) async => [testQuestionMap]);
      // act
      final result = await dataSource.getCachedQuestion();
      // assert
      expect(result, [testQuestionTable]);
    });

    test('should throw CacheException when data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getQuestionCache()).thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedQuestion();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('Get Session', () {
    final data = SessionData(
      token: 'token',
      userid: 1,
      expiry: 'expiry',
      email: 'email',
      username: 'username',
    );

    test('should return a valid session data when login is true', () async {
      // arrange
      when(mockPreferencesHelper.isLogin).thenAnswer((_) async => true);
      when(mockPreferencesHelper.id).thenAnswer((_) async => 1);
      when(mockPreferencesHelper.token).thenAnswer((_) async => 'token');
      when(mockPreferencesHelper.expireDate).thenAnswer((_) async => 'expiry');
      when(mockPreferencesHelper.email).thenAnswer((_) async => 'email');
      when(mockPreferencesHelper.username).thenAnswer((_) async => 'username');
      // act
      final result = await dataSource.getSession();
      // assert
      expect(result.runtimeType, data.runtimeType);
    });

    test('should return a null when login is false', () async {
      // arrange
      when(mockPreferencesHelper.isLogin).thenAnswer((_) async => false);
      when(mockPreferencesHelper.id).thenAnswer((_) async => 1);
      when(mockPreferencesHelper.token).thenAnswer((_) async => 'token');
      when(mockPreferencesHelper.expireDate).thenAnswer((_) async => 'expiry');
      when(mockPreferencesHelper.email).thenAnswer((_) async => 'email');
      when(mockPreferencesHelper.username).thenAnswer((_) async => 'username');
      // act
      final result = await dataSource.getSession();
      // assert
      expect(result, null);
    });
  });

  group('Set Session', () {
    test('should return TRUE when session added', () async {
      // arrange
      when(mockPreferencesHelper.isLogin)
          .thenAnswer((realInvocation) async => true);
      // act
      final result = await dataSource.setSession(data: testSessionData);
      // assert
      expect(result, true);
    });
    test('should return FALSE when session removed', () async {
      // arrange
      when(mockPreferencesHelper.isLogin)
          .thenAnswer((realInvocation) async => false);
      // act
      final result = await dataSource.setSession();
      // assert
      expect(result, false);
    });
  });

  group('Is Dark',(){
    test('should return TRUE when darkMode activated',() async {
      // arrange
      when(mockPreferencesHelper.isDark).thenAnswer((_) async => true);
      // act
      final result = await dataSource.isDark();
      // assert
      expect(result, true);
    });
    test('should return FALSE when darkMode deactivated',() async {
      // arrange
      when(mockPreferencesHelper.isDark).thenAnswer((_) async => false);
      // act
      final result = await dataSource.isDark();
      // assert
      expect(result, false);
    });
  });

  group('Set Dark',(){
    test('should return TRUE when darkMode set on',() async {
      // arrange
      when(mockPreferencesHelper.isDark).thenAnswer((_) async => true);
      // act
      final result = await dataSource.setDark(true);
      // assert
      expect(result, true);
    });
    test('should return FALSE when darkMode set off',() async {
      // arrange
      when(mockPreferencesHelper.isDark).thenAnswer((_) async => false);
      // act
      final result = await dataSource.setDark(false);
      // assert
      expect(result, false);
    });
  });
}

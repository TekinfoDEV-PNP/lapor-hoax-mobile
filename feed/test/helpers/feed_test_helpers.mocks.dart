// Mocks generated by Mockito 5.0.16 from annotations
// in feed/test/helpers/feed_test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:core/data/models/register_model.dart' as _i15;
import 'package:core/data/models/report_request.dart' as _i16;
import 'package:core/data/models/user_response.dart' as _i14;
import 'package:core/data/models/user_token.dart' as _i13;
import 'package:core/domain/entities/category.dart' as _i6;
import 'package:core/domain/entities/feed.dart' as _i7;
import 'package:core/domain/entities/question.dart' as _i8;
import 'package:core/domain/entities/report.dart' as _i9;
import 'package:core/domain/entities/session_data.dart' as _i10;
import 'package:core/domain/entities/user.dart' as _i11;
import 'package:core/domain/entities/user_question.dart' as _i12;
import 'package:core/domain/repositories/repository.dart' as _i3;
import 'package:core/utils/failure.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i3.Repository {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> deleteReport(
          String? token, int? id) =>
      (super.noSuchMethod(Invocation.method(#deleteReport, [token, id]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Category>>> getCategories() =>
      (super
              .noSuchMethod(Invocation.method(#getCategories, []),
                  returnValue:
                      Future<_i2.Either<_i5.Failure, List<_i6.Category>>>.value(
                          _FakeEither_0<_i5.Failure, List<_i6.Category>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Category>>>);
  @override
  _i4.Future<bool> isAddedToSavedFeed(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToSavedFeed, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<bool> isSessionActivated() =>
      (super.noSuchMethod(Invocation.method(#isSessionActivated, []),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Feed>>> getFeeds() =>
      (super.noSuchMethod(Invocation.method(#getFeeds, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i7.Feed>>>.value(
              _FakeEither_0<_i5.Failure, List<_i7.Feed>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i7.Feed>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.Feed>> getFeedDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getFeedDetail, [id]),
              returnValue: Future<_i2.Either<_i5.Failure, _i7.Feed>>.value(
                  _FakeEither_0<_i5.Failure, _i7.Feed>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i7.Feed>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> getPasswordReset(String? email) =>
      (super.noSuchMethod(Invocation.method(#getPasswordReset, [email]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Question>>> getQuestions() =>
      (super.noSuchMethod(Invocation.method(#getQuestions, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i8.Question>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i8.Question>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Question>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i9.Report>>> getReports(
          String? token, int? id) =>
      (super.noSuchMethod(Invocation.method(#getReports, [token, id]),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i9.Report>>>.value(
              _FakeEither_0<_i5.Failure, List<_i9.Report>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i9.Report>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Feed>>> getSavedFeeds() =>
      (super.noSuchMethod(Invocation.method(#getSavedFeeds, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i7.Feed>>>.value(
              _FakeEither_0<_i5.Failure, List<_i7.Feed>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i7.Feed>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i10.SessionData>> getSessionData() =>
      (super.noSuchMethod(Invocation.method(#getSessionData, []),
          returnValue: Future<_i2.Either<_i5.Failure, _i10.SessionData>>.value(
              _FakeEither_0<_i5.Failure, _i10.SessionData>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i10.SessionData>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i11.User>> getUser(String? email) =>
      (super.noSuchMethod(Invocation.method(#getUser, [email]),
              returnValue: Future<_i2.Either<_i5.Failure, _i11.User>>.value(
                  _FakeEither_0<_i5.Failure, _i11.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i11.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i12.UserQuestion>> getUserChallenge(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getUserChallenge, [id]),
          returnValue: Future<_i2.Either<_i5.Failure, _i12.UserQuestion>>.value(
              _FakeEither_0<_i5.Failure, _i12.UserQuestion>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i12.UserQuestion>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> postChangePassword(
          String? oldPass, String? newPass, String? token) =>
      (super.noSuchMethod(
              Invocation.method(#postChangePassword, [oldPass, newPass, token]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> postFCMToken(
          int? user, String? fcmToken) =>
      (super.noSuchMethod(Invocation.method(#postFCMToken, [user, fcmToken]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> putFCMToken(
          int? user, String? fcmToken) =>
      (super.noSuchMethod(Invocation.method(#putFCMToken, [user, fcmToken]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i13.UserToken>> postLogin(
          String? username, String? password) =>
      (super.noSuchMethod(Invocation.method(#postLogin, [username, password]),
          returnValue: Future<_i2.Either<_i5.Failure, _i13.UserToken>>.value(
              _FakeEither_0<_i5.Failure, _i13.UserToken>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i13.UserToken>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i14.UserResponse>> postRegister(
          _i15.RegisterModel? user) =>
      (super.noSuchMethod(Invocation.method(#postRegister, [user]),
          returnValue: Future<_i2.Either<_i5.Failure, _i14.UserResponse>>.value(
              _FakeEither_0<_i5.Failure, _i14.UserResponse>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i14.UserResponse>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i9.Report>> postReport(
          String? token, _i16.ReportRequest? report) =>
      (super.noSuchMethod(Invocation.method(#postReport, [token, report]),
              returnValue: Future<_i2.Either<_i5.Failure, _i9.Report>>.value(
                  _FakeEither_0<_i5.Failure, _i9.Report>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i9.Report>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> postUserChallenge(
          _i12.UserQuestion? challenge) =>
      (super.noSuchMethod(Invocation.method(#postUserChallenge, [challenge]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> removeFeed(_i7.Feed? feed) =>
      (super.noSuchMethod(Invocation.method(#removeFeed, [feed]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> removeSessionData(
          _i10.SessionData? data) =>
      (super.noSuchMethod(Invocation.method(#removeSessionData, [data]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> saveFeed(_i7.Feed? feed) =>
      (super.noSuchMethod(Invocation.method(#saveFeed, [feed]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> saveSessionData(
          _i10.SessionData? data) =>
      (super.noSuchMethod(Invocation.method(#saveSessionData, [data]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  String toString() => super.toString();
}

/*
 * Created by andii on 16/11/21 09.46
 * Copyright (c) 2021 . All rights reserved.
 * Last modified 16/11/21 08.51
 */

// Mocks generated by Mockito 5.0.16 from annotations
// in laporhoax/test/presentation/provider/login_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:laporhoax/domain/entities/session_data.dart' as _i11;
import 'package:laporhoax/domain/entities/user.dart' as _i9;
import 'package:laporhoax/domain/entities/user_token.dart' as _i7;
import 'package:laporhoax/domain/repositories/repository.dart' as _i2;
import 'package:laporhoax/domain/usecases/get_session_data.dart' as _i12;
import 'package:laporhoax/domain/usecases/get_user.dart' as _i8;
import 'package:laporhoax/domain/usecases/post_login.dart' as _i4;
import 'package:laporhoax/domain/usecases/remove_session_data.dart' as _i13;
import 'package:laporhoax/domain/usecases/save_session_data.dart' as _i10;
import 'package:laporhoax/utils/failure.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeRepository_0 extends _i1.Fake implements _i2.Repository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [PostLogin].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostLogin extends _i1.Mock implements _i4.PostLogin {
  MockPostLogin() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Repository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeRepository_0()) as _i2.Repository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.UserToken>> execute(
          String? username, String? password) =>
      (super.noSuchMethod(Invocation.method(#execute, [username, password]),
              returnValue: Future<_i3.Either<_i6.Failure, _i7.UserToken>>.value(
                  _FakeEither_1<_i6.Failure, _i7.UserToken>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i7.UserToken>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUser extends _i1.Mock implements _i8.GetUser {
  MockGetUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Repository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeRepository_0()) as _i2.Repository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i9.User>> execute(String? email) =>
      (super.noSuchMethod(Invocation.method(#execute, [email]),
              returnValue: Future<_i3.Either<_i6.Failure, _i9.User>>.value(
                  _FakeEither_1<_i6.Failure, _i9.User>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i9.User>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SaveSessionData].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveSessionData extends _i1.Mock implements _i10.SaveSessionData {
  MockSaveSessionData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Repository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeRepository_0()) as _i2.Repository);
  @override
  _i5.Future<String> execute(_i11.SessionData? data) =>
      (super.noSuchMethod(Invocation.method(#execute, [data]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetSessionData].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSessionData extends _i1.Mock implements _i12.GetSessionData {
  MockGetSessionData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Repository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeRepository_0()) as _i2.Repository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i11.SessionData?>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i3.Either<_i6.Failure, _i11.SessionData?>>.value(
              _FakeEither_1<_i6.Failure, _i11.SessionData?>())) as _i5
          .Future<_i3.Either<_i6.Failure, _i11.SessionData?>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [RemoveSessionData].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveSessionData extends _i1.Mock implements _i13.RemoveSessionData {
  MockRemoveSessionData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Repository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeRepository_0()) as _i2.Repository);
  @override
  _i5.Future<String> execute(_i11.SessionData? data) =>
      (super.noSuchMethod(Invocation.method(#execute, [data]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SessionData].
///
/// See the documentation for Mockito's code generation for more information.
class MockSessionData extends _i1.Mock implements _i11.SessionData {
  MockSessionData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get token =>
      (super.noSuchMethod(Invocation.getter(#token), returnValue: '')
          as String);
  @override
  int get userid =>
      (super.noSuchMethod(Invocation.getter(#userid), returnValue: 0) as int);
  @override
  String get expiry =>
      (super.noSuchMethod(Invocation.getter(#expiry), returnValue: '')
          as String);
  @override
  String get email =>
      (super.noSuchMethod(Invocation.getter(#email), returnValue: '')
          as String);
  @override
  String get username =>
      (super.noSuchMethod(Invocation.getter(#username), returnValue: '')
          as String);
  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
          as List<Object?>);
  @override
  String toString() => super.toString();
}

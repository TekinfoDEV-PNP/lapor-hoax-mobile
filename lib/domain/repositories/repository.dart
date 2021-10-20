import 'package:dartz/dartz.dart';
import 'package:laporhoax/common/failure.dart';
import 'package:laporhoax/data/models/category_model.dart';
import 'package:laporhoax/data/models/report_request.dart';
import 'package:laporhoax/data/models/user_question_model.dart';
import 'package:laporhoax/data/models/user_response.dart';
import 'package:laporhoax/data/models/user_token.dart';
import 'package:laporhoax/domain/entities/category.dart';
import 'package:laporhoax/domain/entities/feed.dart';
import 'package:laporhoax/domain/entities/report.dart';
import 'package:laporhoax/domain/entities/user.dart';
import 'package:laporhoax/domain/entities/user_question.dart';

abstract class Repository {
  Future<Either<Failure, UserToken>> postLogin(
      String username, String password);

  Future<Either<Failure, UserRegister>> postRegister(UserLogin user);

  Future<Either<Failure, UserQuestion>> postUserChallenge(
      UserQuestion challenge);

  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, User>> getUser(String email);

  Future<Either<Failure, List<Report>>> getReports(String token, String id);

  Future<Either<Failure, Report>> postReport(
      String token, ReportRequest report);

  Future<Either<Failure, String>> deleteReport(String token, Report report);

  Future<Either<Failure, List<Feed>>> getFeeds();

  Future<Either<Failure, String>> saveFeed(Feed feed);

  Future<Either<Failure, String>> removeFeed(Feed feed);

  Future<bool> isAddedToSavedFeed(int id);

  Future<Either<Failure, List<Feed>>> getSavedFeeds();
}

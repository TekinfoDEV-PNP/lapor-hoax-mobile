import 'package:dartz/dartz.dart';
import 'package:laporhoax/domain/entities/user_question.dart';
import 'package:laporhoax/domain/repositories/repository.dart';
import 'package:laporhoax/utils/failure.dart';

class PostUserChallenge {
  final Repository repository;

  PostUserChallenge(this.repository);

  Future<Either<Failure, String>> execute(UserQuestion challenge) {
    return repository.postUserChallenge(challenge);
  }
}
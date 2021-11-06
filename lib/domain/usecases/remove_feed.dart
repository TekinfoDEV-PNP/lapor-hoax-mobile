import 'package:dartz/dartz.dart';
import 'package:laporhoax/domain/entities/feed.dart';
import 'package:laporhoax/domain/repositories/repository.dart';
import 'package:laporhoax/utils/failure.dart';

class RemoveFeed {
  final Repository repository;

  RemoveFeed(this.repository);

  Future<Either<Failure, String>> execute(Feed feed) {
    return repository.removeFeed(feed);
  }
}
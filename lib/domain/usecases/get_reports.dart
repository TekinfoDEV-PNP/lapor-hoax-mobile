import 'package:dartz/dartz.dart';
import 'package:laporhoax/common/failure.dart';
import 'package:laporhoax/domain/entities/report.dart';
import 'package:laporhoax/domain/repositories/repository.dart';

class GetReports {
  final Repository repository;

  GetReports(this.repository);

  Future<Either<Failure, List<Report>>> execute(String token, String id) {
    return repository.getReports(token, id);
  }
}
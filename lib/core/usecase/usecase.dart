import 'package:dartz/dartz.dart';
import 'package:dit_battery_status/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParam {}
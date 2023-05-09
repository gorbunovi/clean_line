import 'package:clean_line/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class UseCaseNoType<Params> {
  Future<Either<Failure, void>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
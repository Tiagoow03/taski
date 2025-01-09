import 'package:dartz/dartz.dart';

class RequestResult<Failure, Success> {
  final Either<Failure, Success> _either;

  RequestResult(this._either);

  factory RequestResult.success(Success value) => RequestResult(Right(value));

  factory RequestResult.failure(Failure failure) => RequestResult(Left(failure));

  R fold<R>(R Function(Failure) onFailure, R Function(Success) onSuccess) {
    return _either.fold(onFailure, onSuccess);
  }
}

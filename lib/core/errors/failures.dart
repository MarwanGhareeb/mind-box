interface class Failure {
  final String message;

  Failure(this.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(super.message);
}

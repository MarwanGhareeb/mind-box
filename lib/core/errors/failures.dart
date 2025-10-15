abstract class Failures {
  final String message;

  Failures(this.message);
}

class CacheFailure extends Failures {
  CacheFailure(super.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class LocalDatabaseException implements Exception {
  final String message;

  LocalDatabaseException(this.message);
}

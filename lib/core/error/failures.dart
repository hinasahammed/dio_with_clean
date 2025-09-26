abstract class Failures {
  Failures({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

class ServerFailure extends Failures {
  ServerFailure({required super.message, super.statusCode});
}

class NetworkFailure extends Failures {
  NetworkFailure({required super.message});
}

class CacheFailure extends Failures {
  CacheFailure({required super.message});
}

class ValidationFailure extends Failures {
  ValidationFailure({required super.message});
}

abstract class Failure {
  String message;
  Failure({required this.message});
}

class UnExpectedFailure extends Failure {
  UnExpectedFailure({required super.message});
}
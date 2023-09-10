class Failure implements Exception {
  final String message;
  Failure([this.message = "Category Fetch Failure"]);

  @override
  String toString() => 'Failure{message: $message}';
}

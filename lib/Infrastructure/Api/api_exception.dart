class ApiException implements Exception {
  final statusCode;
  final message;
  ApiException({this.statusCode, this.message}) {
    print(statusCode);
    print(message);
  }

  String toString() {
    return statusCode.toString();
  }
}

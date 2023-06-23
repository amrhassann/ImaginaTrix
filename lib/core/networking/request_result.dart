class RequestResult<T> {
  final bool containError;
  final String? errorMessage;
  final int? statusCode;
  final T? data;

  const RequestResult({
    required this.containError,
    this.errorMessage,
    this.statusCode,
    this.data,
  });
}

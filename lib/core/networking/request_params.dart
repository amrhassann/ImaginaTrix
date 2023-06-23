class RequestParams {
  final dynamic body;
  final String url;
  final Map<String, dynamic>? params;

  const RequestParams({required this.url, this.body, this.params});

}

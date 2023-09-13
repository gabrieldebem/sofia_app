class HttoErrorResponse {
  final int statusCode;
  final String message;

  HttoErrorResponse({
    required this.statusCode,
    required this.message,
  });

  factory HttoErrorResponse.fromJson(Map<String, dynamic> json) {
    return HttoErrorResponse(
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}

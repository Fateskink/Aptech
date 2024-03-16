class ApiResponse {
  final String message;
  final String status;
  final Map<String, dynamic> data;

  ApiResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? '',
      data: json['data'] ?? {},
    );
  }
}

class AuthBaseResponseModel {
  int statusCode;
  String? message;
  String? status;
  dynamic data;

  AuthBaseResponseModel({
    required this.statusCode,
    required this.message,
    required this.status,
    this.data,
  });

  factory AuthBaseResponseModel.fromJson({
    required int statusCode,
    required dynamic data,
  }) {
    return AuthBaseResponseModel(
        statusCode: statusCode,
        message: data['message'],
        status: data['status'],
        data: data['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data,
      'statusCode': statusCode,
    };
  }
}

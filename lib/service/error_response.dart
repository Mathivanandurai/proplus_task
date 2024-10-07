// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  int statusCode;
  String message;
  dynamic error;

  ErrorResponse({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    statusCode: json["statusCode"]??100,
    message: json["message"]??"No Response",
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "error": error,
  };
}

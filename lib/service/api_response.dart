// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';


ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  String message;
  dynamic data;

  ApiResponse({
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toProfileJson(),
      };
}

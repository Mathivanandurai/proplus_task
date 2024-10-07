class ApiException implements Exception {
  final dynamic message;
  final dynamic prefix;

  ApiException([this.message, this.prefix]);

  @override
  String toString() {
    return "$message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([message]) : super(message, "Fetch Data Error");
}

class CancelResponseException extends ApiException {
  CancelResponseException([message]) : super(message, "Fetch Data Error");
}

class OlderAppVersionException extends ApiException {
  OlderAppVersionException([message]) : super(message, "Older App Version");
}

class BadResponseException extends ApiException {
  BadResponseException([message]) : super(message, "Invalid Request. ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, "Unauthorised. ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([message]) : super(message, "Invalid Input. ");
}

class NotFoundException extends ApiException {
  NotFoundException([message]) : super(message, "Not Found. ");
}

class InternetConnectivityException extends ApiException {
  InternetConnectivityException([message])
      : super(message == "" || message == null
            ? "No Internet Connection"
            : message);
}

class InternalServerException extends ApiException {
  InternalServerException([message])
      : super(message, "Internal Server Error. ");
}

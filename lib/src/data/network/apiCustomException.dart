class CustomException implements Exception {
 late final _message;
 late final _prefix;
 late final _statusCode;
  CustomException([this._message, this._prefix,this._statusCode]);

@override
  String toString() {
    // TODO: implement toString
    return _message;
  }

}

class FetchDataException extends CustomException {
  FetchDataException([String? message,int? statusCode])
      : super(message, "Error During Communication: ",statusCode);
}

class BadRequestException extends CustomException {
  BadRequestException([message,statusCode]) : super(message, "Invalid Request: ",statusCode);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message,statusCode]) : super(message, "Unauthorised: ",statusCode);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message,statusCode]) : super(message, "Invalid Input: ",statusCode);
}
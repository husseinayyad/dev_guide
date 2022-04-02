



import 'apiStatus.dart';

class ApiResource<T> {
  ApiResource(this.status, this.message, this.data);
  late  final ApiStatus status;

  late final String message;

    T data;

  // get length => null;
}

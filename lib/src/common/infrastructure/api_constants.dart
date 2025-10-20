// ignore_for_file: avoid_classes_with_only_static_members

abstract class ApiConstants {
  static const String baseUrl =
      'https://url-shortener-server.onrender.com/api/alias';

  static const String shortenEndpoint = '/';
  static String retrieveEndpoint(int id) => '/$id';

  static const Duration timeoutDuration = Duration(seconds: 10);
  static const Duration receiveTimeoutDuration = Duration(seconds: 10);
  static const int maxRetries = 3;
}

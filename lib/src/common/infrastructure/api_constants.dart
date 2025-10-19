abstract class ApiConstants {
  static const String baseUrl =
      'https://url-shortener-server.onrender.com/api/';

  static const Duration timeoutDuration = Duration(seconds: 10);
  static const Duration receiveTimeoutDuration = Duration(seconds: 10);
  static const int maxRetries = 3;
}

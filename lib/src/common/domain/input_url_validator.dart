import 'input_url.dart';

extension InputUrlValidator on InputUrl {
  /// Validates the URL and returns an error message if invalid, otherwise null.
  String? validate() {
    if (url.isEmpty) {
      return 'URL cannot be empty';
    }
    if (Uri.tryParse(url) == null) {
      return 'This is not a valid URL';
    }

    return null;
  }

  bool isValid() => validate() == null;
}

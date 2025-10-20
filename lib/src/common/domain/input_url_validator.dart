import '../presentation/ui_strings.dart';
import 'input_url.dart';

extension InputUrlValidator on InputUrl {
  /// Validates the URL and returns an error message if invalid, otherwise null.
  String? validate() {
    if (url.trim().isEmpty) {
      return UIStrings.urlCannotBeEmpty;
    }

    final uri = Uri.tryParse(url.trim());
    if (uri == null) {
      return UIStrings.invalidUrlFormat;
    }

    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return UIStrings.invalidUrlProtocol;
    }

    if (uri.host.isEmpty) {
      return UIStrings.invalidUrlHost;
    }

    return null;
  }

  bool isValid() => validate() == null;
}

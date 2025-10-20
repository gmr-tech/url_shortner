/// Wrapper for all UI strings used in the app.
///
/// A good future suggestions is to use intl and i18n for strings translation.
abstract class UIStrings {
  static const String appTitle = 'URL Shortener App';
  static const String noShortenedUrls = 'No shortened URLs yet!';
  static const String recentlyShortenedUrls = 'Recently shortened URLs';
  static const String failureMessage =
      'Failed to shorten URL, please try again.';
  static const String successMessage =
      'Short URL generated and copied to clipboard successfully!';
  static const String enterUrlHint = 'Enter a URL to shorten';
  static const String copyShortUrl = 'Copy short URL';
  static const String copyOriginalUrl = 'Copy original URL';
  static const String deleteFromHistory = 'Delete from history';
  static const String urlCopiedToClipboard =
      'URL copied to clipboard successfully!';
  static const String wantToPasteUrl =
      'Do you want to paste the URL from clipboard?';
  static const String dismiss = 'Dismiss';
  static const String paste = 'Paste';
  static const String yesterdayAt = 'Ontem às';
}

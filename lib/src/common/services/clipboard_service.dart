abstract interface class ClipboardService {
  Future<String?> getText();
  Future<void> setText(String text);
}

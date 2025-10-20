import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'clipboard_service.dart';

@LazySingleton(as: ClipboardService)
class ClipboardServiceImpl implements ClipboardService {
  @override
  Future<String?> getText() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  @override
  Future<void> setText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}

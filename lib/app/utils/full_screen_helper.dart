import 'fullscreen_stub.dart'
    if (dart.library.html) 'fullscreen_web.dart'
    if (dart.library.io) 'fullscreen_mobile.dart';

class FullscreenHelper {
  static Future<void> enterFullscreen() async {
    await enterFullscreenImpl();
  }

  static Future<void> exitFullscreen() async {
    await exitFullscreenImpl();
  }

  static Future<void> toggleFullscreen() async {
    await toggleFullscreenImpl();
  }

  static Future<bool> isFullscreen() async {
    return await isFullscreenImpl();
  }
}

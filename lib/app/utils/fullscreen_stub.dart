// fullscreen_stub.dart
// Este arquivo nunca será usado, mas é necessário para compilação

Future<void> enterFullscreenImpl() async {
  throw UnsupportedError('Fullscreen is not supported on this platform');
}

Future<void> exitFullscreenImpl() async {
  throw UnsupportedError('Fullscreen is not supported on this platform');
}

Future<void> toggleFullscreenImpl() async {
  throw UnsupportedError('Fullscreen is not supported on this platform');
}

Future<bool> isFullscreenImpl() async {
  throw UnsupportedError('Fullscreen is not supported on this platform');
}
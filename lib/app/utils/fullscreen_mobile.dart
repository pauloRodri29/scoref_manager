// lib/app/utils/fullscreen_mobile.dart
import 'package:flutter/services.dart';

bool _isFullscreen = false;

Future<void> enterFullscreenImpl() async {
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );
}

Future<void> exitFullscreenImpl() async {
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: SystemUiOverlay.values,
  );
}

Future<void> toggleFullscreenImpl() async {
  // No mobile, vamos sempre entrar em fullscreen quando chamado
  await enterFullscreenImpl();
}

Future<bool> isFullscreenImpl() async {
  return _isFullscreen;
}

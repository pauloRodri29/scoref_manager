// lib/app/utils/fullscreen_web.dart
import 'dart:html' as html;

Future<void> enterFullscreenImpl() async {
  html.document.documentElement?.requestFullscreen();
}

Future<void> exitFullscreenImpl() async {
  html.document.exitFullscreen();
}

Future<void> toggleFullscreenImpl() async {
  if (html.document.fullscreenElement != null) {
    await exitFullscreenImpl();
  } else {
    await enterFullscreenImpl();
  }
}
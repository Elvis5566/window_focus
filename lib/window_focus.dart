import 'dart:async';

import 'package:flutter/services.dart';

class WindowFocus {
  static const MethodChannel _channel =
  const MethodChannel('window_focus');

  static EventChannel _eventChannel = EventChannel('window_focus_stream');

  static Stream<bool>? _windowFocusStream;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Stream<bool> getWindowFocusChangedStream() {
    if (_windowFocusStream != null) return _windowFocusStream!;

    _windowFocusStream = _eventChannel.receiveBroadcastStream().map<bool>((value) => value);
    return _windowFocusStream!;
  }

}

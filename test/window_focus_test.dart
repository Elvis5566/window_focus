import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:window_focus/window_focus.dart';

void main() {
  const MethodChannel channel = MethodChannel('window_focus');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await WindowFocus.platformVersion, '42');
  });
}

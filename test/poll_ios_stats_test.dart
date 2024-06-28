import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poll_ios_stats/poll_ios_stats.dart';

void main() {
  const MethodChannel channel = MethodChannel('dev.flutter.pigeon.poll_ios_stats.PollIosStats.pollStartupTime');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return StartupTime(startupTime: 42);
    });
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('getPlatformVersion', () async {
    expect((await PollIosStats().pollStartupTime()).startupTime, '42');
  });
}

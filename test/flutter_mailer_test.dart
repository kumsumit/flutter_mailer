import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_mailer');

  Future<Object?>? channelMethod(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'send':
        return null;
      case 'isAppInstalled':
        return true;
      default:
        return null;
    }
  }

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      channelMethod,
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('send', () async {
    final MailOptions mailOptions = MailOptions(
        subject: 'Subject',
        body: 'Body',
        recipients: <String>['example@domain.com']);

    expect(FlutterMailer.send(mailOptions), completes);
  });

  test('isAppInstalled', () async {
    expect(FlutterMailer.isAppInstalled('com.empty'), completes);
  });
}

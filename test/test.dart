library test.platform_info;

import 'package:test/test.dart';
import 'package:platform_info/platform_info.dart';

void main() {
  group('platform_info', () {
    test('shouldRun', () {
      expect(Platform.I, platform);
      expect(() => Platform.I, returnsNormally);
    });

    test('shouldCreate', () {
      final platform = Platform.I;
      expect(platform is Platform, true);
    });

    test('types', () {
      expect(platform is Platform, true);
      expect(platform.buildMode is BuildMode, true);
      expect(platform.isMobile is bool, true);
      expect(platform.isCupertino is bool, true);
      expect(platform.isMaterial is bool, true);
      expect(platform.isDesktop is bool, true);
      expect(platform.isOperatingSystemKnown is bool, true);
      expect(platform.locale is String, true);
      expect(platform.numberOfProcessors is int, true);
      expect(platform.operatingSystem is OperatingSystem, true);
      expect(platform.type is HostPlatformType, true);
      expect(platform.version is String, true);
      expect(platform.isAndroid is bool, true);
      expect(platform.isWindows is bool, true);
      expect(platform.isFuchsia is bool, true);
      expect(platform.isIOS is bool, true);
      expect(platform.isLinux is bool, true);
      expect(platform.isMacOS is bool, true);
    });

    test('identical', () {
      final platform1 = Platform.I;
      final platform2 = Platform.instance;
      final platform3 = platform;
      expect(platform1 == platform2, true);
      expect(platform2 == platform3, true);
      expect(identical(platform1, platform2), true);
      expect(identical(platform2, platform3), true);
    });
  });
}

library test.platform_info;

import 'package:test/test.dart';
import 'package:platform_info/platform_info.dart';

void main() {
  group('platform_info', () {
    test('shouldRun', () {
      Platform();
      expect(true, true);
    });

    test('shouldCreate', () {
      Platform platform = Platform();
      expect(platform is Platform, true);
    });

    test('types', () {
      Platform platform = Platform();
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
    });

    test('toJson', () {
      Platform platform = Platform();
      expect(platform.toJson() is Map<String, dynamic>, true);
    });

    test('identical', () {
      Platform platform1 = Platform();
      Platform platform2 = Platform();
      expect(platform1 == platform2, true);
      expect(identical(platform1, platform2), true);
    });
  });
}

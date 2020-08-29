import 'package:platform_info/src/stub_host_platform.dart';
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
      expect(platform is Platform, isTrue);
      expect(platform.buildMode is BuildMode, isTrue);
      expect(platform.isMobile is bool, isTrue);
      expect(platform.isCupertino is bool, isTrue);
      expect(platform.isMaterial is bool, isTrue);
      expect(platform.isDesktop is bool, isTrue);
      expect(platform.isOperatingSystemKnown is bool, isTrue);
      expect(platform.locale is String, isTrue);
      expect(platform.numberOfProcessors is int, isTrue);
      expect(platform.operatingSystem is OperatingSystem, isTrue);
      expect(platform.type is HostPlatformType, isTrue);
      expect(platform.version is String, isTrue);
      expect(platform.isAndroid is bool, isTrue);
      expect(platform.isWindows is bool, isTrue);
      expect(platform.isFuchsia is bool, isTrue);
      expect(platform.isIOS is bool, isTrue);
      expect(platform.isLinux is bool, isTrue);
      expect(platform.isMacOS is bool, isTrue);
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

    test('hashcode', () {
      final platform1 = Platform.I;
      final platform2 = platform;
      expect(platform1.hashCode, 0);
      expect(platform1.hashCode, platform2.hashCode);
    });

    test('toString', () {
      expect(Platform.I.toString(), Platform.I.version);
    });

    test('Default values', () {
      final def = getHostPlatform();
      const type = identical(0, 0.0)
          ? HostPlatformType.web
          : HostPlatformType.io;
      expect(def.operatingSystem, OperatingSystem.unknown);
      expect(def.numberOfProcessors, 0);
      expect(def.locale, 'en');
      expect(def.version, '<unknown>');
      expect(def.type, type);
    });
  });
}

import 'dart:async';

import 'package:platform_info/src/stub_host_platform.dart' as stub;
import 'package:platform_info/src/io_host_platform.dart' as io;
import 'package:test/test.dart';
import 'package:platform_info/platform_info.dart';

void main() {
  group('Platform', () {
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
      expect(platform.isWeb is bool, isTrue);
      expect(platform.isIO is bool, isTrue);
      expect(platform.isDesktop is bool, isTrue);
      expect(platform.isMobile is bool, isTrue);
      expect(platform.isCupertino is bool, isTrue);
      expect(platform.isMaterial is bool, isTrue);
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
  });

  group('Stub platform', () {
    test('Default values', () {
      final stubPlatform = stub.getHostPlatform();
      const type =
          identical(0, 0.0) ? HostPlatformType.web : HostPlatformType.io;
      expect(() => const stub.DefaultHostPlatform(), returnsNormally);
      // ignore: prefer_const_constructors
      expect(() => stub.DefaultHostPlatform(), returnsNormally);
      expect(stubPlatform, const stub.DefaultHostPlatform());
      expect(stubPlatform.operatingSystem, OperatingSystem.unknown);
      expect(stubPlatform.numberOfProcessors, 0);
      expect(stubPlatform.locale, 'en');
      expect(stubPlatform.version, '<unknown>');
      expect(stubPlatform.type, type);
    });
  });

  group('io platform test', () {
    test('unknown environment', () {
      runZoned(
        () {
          final ioPlatform = io.getHostPlatform();
          expect(ioPlatform.operatingSystem, OperatingSystem.unknown);
          expect(ioPlatform.numberOfProcessors, 0);
          expect(ioPlatform.locale, 'en');
          expect(ioPlatform.version, '<unknown>');
          expect(ioPlatform.type, HostPlatformType.io);
        },
        zoneValues: {#platform_info_test.isUnknownEnvironment: true},
      );
    });
  });

  group('PlatformMethods', () {
    bool returnTrue() => true;
    bool returnFalse() => false;

    FakePlatform platform;

    setUpAll(() {
      platform = FakePlatform();
    });

    test('Operating System', () {
      platform
        ..reset()
        ..isFuchsia = true;
      expect(
          platform.when(
            fuchsia: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isWindows = true;
      expect(
          platform.when(
            windows: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isAndroid = true;
      expect(
          platform.when(
            android: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isIOS = true;
      expect(
          platform.when(
            iOS: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isMacOS = true;
      expect(
          platform.when(
            macOS: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isLinux = true;
      expect(
          platform.when(
            linux: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isOperatingSystemKnown = false;
      expect(
          platform.when(
            unknown: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Design', () {
      platform
        ..reset()
        ..isMaterial = true;
      expect(
          platform.when(
            material: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isCupertino = true;
      expect(
          platform.when(
            cupertino: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Mobile/Desktop', () {
      platform
        ..reset()
        ..isMobile = true;
      expect(
          platform.when(
            mobile: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isDesktop = true;
      expect(
          platform.when(
            desktop: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('IO or Web', () {
      platform
        ..reset()
        ..isIO = true;
      expect(
          platform.when(
            io: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..isWeb = true;
      expect(
          platform.when(
            web: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Build mode', () {
      platform
        ..reset()
        ..buildMode = BuildMode.debug;
      expect(
          platform.when(
            debug: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..buildMode = BuildMode.profile;
      expect(
          platform.when(
            profile: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      platform
        ..reset()
        ..buildMode = BuildMode.release;
      expect(
          platform.when(
            release: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('orElse', () {
      expect(
          platform.when(
            orElse: returnTrue,
          ),
          isTrue);

      expect(
          platform.when(
            orElse: returnFalse,
          ),
          isFalse);

      expect(platform.when(), isNull);
    });

    test('Chaining', () {
      expect(
          platform.when(
            io: () => platform.when(
              material: returnTrue,
              cupertino: returnTrue,
              orElse: returnTrue,
            ),
            orElse: returnFalse,
          ),
          isTrue);
    });
  });
}

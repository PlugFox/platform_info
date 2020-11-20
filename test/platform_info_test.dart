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
      runZoned(() {
        final ioPlatform = io.getHostPlatform();
        expect(ioPlatform.operatingSystem, OperatingSystem.unknown);
        expect(ioPlatform.numberOfProcessors, 0);
        expect(ioPlatform.locale, 'en');
        expect(ioPlatform.version, '<unknown>');
        expect(ioPlatform.type, HostPlatformType.io);
      }, zoneValues: {#platform_info_test.isUnknownEnvironment: true});
    });
  });

  group('PlatformMethods', () {
    bool returnTrue() => true;
    bool returnFalse() => false;

    test('Operating System', () {
      expect(
          platform.when(
            fuchsia: returnTrue,
            orElse: returnFalse,
          ),
          platform.isFuchsia);
      expect(
          platform.when(
            windows: returnTrue,
            orElse: returnFalse,
          ),
          platform.isWindows);
      expect(
          platform.when(
            android: returnTrue,
            orElse: returnFalse,
          ),
          platform.isAndroid);
      expect(
          platform.when(
            iOS: returnTrue,
            orElse: returnFalse,
          ),
          platform.isIOS);
      expect(
          platform.when(
            macOS: returnTrue,
            orElse: returnFalse,
          ),
          platform.isMacOS);
      expect(
          platform.when(
            linux: returnTrue,
            orElse: returnFalse,
          ),
          platform.isLinux);
      expect(
          platform.when(
            unknown: returnTrue,
            orElse: returnFalse,
          ),
          !platform.isOperatingSystemKnown);
    });

    test('Design', () {
      expect(
          platform.when(
            material: returnTrue,
            orElse: returnFalse,
          ),
          platform.isMaterial);
      expect(
          platform.when(
            cupertino: returnTrue,
            orElse: returnFalse,
          ),
          platform.isCupertino);
    });

    test('Mobile/Desktop', () {
      expect(
          platform.when(
            mobile: returnTrue,
            orElse: returnFalse,
          ),
          platform.isMobile);
      expect(
          platform.when(
            desktop: returnTrue,
            orElse: returnFalse,
          ),
          platform.isDesktop);
    });

    test('IO or Web', () {
      expect(
          platform.when(
            io: returnTrue,
            orElse: returnFalse,
          ),
          platform.isIO);
      expect(
          platform.when(
            web: returnTrue,
            orElse: returnFalse,
          ),
          platform.isWeb);
    });

    test('Build mode', () {
      expect(
          platform.when(
            debug: returnTrue,
            orElse: returnFalse,
          ),
          platform.buildMode == BuildMode.debug);
      expect(
          platform.when(
            profile: returnTrue,
            orElse: returnFalse,
          ),
          platform.buildMode == BuildMode.profile);
      expect(
          platform.when(
            release: returnTrue,
            orElse: returnFalse,
          ),
          platform.buildMode == BuildMode.release);
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
            orElse: returnTrue,
          ),
          isTrue);
    });
  });
}

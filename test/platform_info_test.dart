import 'dart:async';

import 'package:platform_info/platform_info.dart';
import 'package:platform_info/src/default_host_platform.dart';
import 'package:platform_info/src/enums.dart';
import 'package:platform_info/src/io_host_platform.dart' as io;
import 'package:platform_info/src/stub_host_platform.dart' as stub;
import 'package:test/test.dart';

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
      expect(Platform.I.toString(), '<Platform ${Platform.I.version}>');
    });
  });

  group('Stub platform', () {
    test('Default values', () {
      final stubPlatform = stub.getHostPlatform();
      const type =
          identical(0, 0.0) ? HostPlatformType.web : HostPlatformType.io;
      expect(() => const DefaultHostPlatform(), returnsNormally);
      // ignore: prefer_const_constructors, non_const_call_to_literal_constructor
      expect(() => DefaultHostPlatform(), returnsNormally);
      expect(stubPlatform, const DefaultHostPlatform());
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

    test('Operating System', () {
      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.fuchsia,
          ).when(
            fuchsia: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.windows,
          ).when(
            windows: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.android,
          ).when(
            android: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.iOS,
          ).when(
            iOS: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.macOS,
          ).when(
            macOS: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.linux,
          ).when(
            linux: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.unknown,
          ).when(
            unknown: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Design', () {
      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.android,
          ).when(
            material: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.iOS,
          ).when(
            cupertino: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Mobile/Desktop', () {
      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.android,
          ).when(
            mobile: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: OperatingSystem.windows,
          ).when(
            desktop: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('IO or Web', () {
      expect(
          FakePlatform(
            type: HostPlatformType.io,
          ).when(
            io: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            type: HostPlatformType.web,
          ).when(
            web: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Build mode', () {
      expect(
          FakePlatform(
            buildMode: BuildMode.debug,
          ).when(
            debug: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            buildMode: BuildMode.profile,
          ).when(
            profile: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            buildMode: BuildMode.release,
          ).when(
            release: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('orElse', () {
      expect(
          FakePlatform().when(
            orElse: returnTrue,
          ),
          isTrue);

      expect(
          FakePlatform().when(
            orElse: returnFalse,
          ),
          isFalse);

      expect(
        FakePlatform().when<Object>(),
        isNull,
      );
    });
  });
}

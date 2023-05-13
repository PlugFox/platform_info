import 'dart:async';

import 'package:platform_info/platform_info.dart';
import 'package:platform_info/src/default_host_platform.dart';
import 'package:platform_info/src/stub_host_platform.dart' as stub;
import 'package:test/test.dart';

// ignore_for_file: unnecessary_statements, avoid_print, cascade_invocations
// ignore_for_file: non_const_call_to_literal_constructor, unnecessary_lambdas
// ignore_for_file: prefer_const_declarations, prefer_const_constructors
// ignore_for_file: unnecessary_type_check

void main() {
  group('Platform', () {
    test('shouldRun', () {
      expect(Platform.I, platform);
      expect(() => Platform.I, returnsNormally);
    });

    test('shouldCreate', () {
      final platform = Platform.I;
      expect(platform, isA<Platform>());
    });

    test('types', () {
      expect(platform, isA<Platform>());
      expect(platform.buildMode, isA<BuildMode>());
      expect(platform.isWeb, isA<bool>());
      expect(platform.isIO, isA<bool>());
      expect(platform.isDesktop, isA<bool>());
      expect(platform.isMobile, isA<bool>());
      expect(platform.isCupertino, isA<bool>());
      expect(platform.isMaterial, isA<bool>());
      expect(platform.isOperatingSystemKnown, isA<bool>());
      expect(platform.locale, isA<String>());
      expect(platform.numberOfProcessors, isA<int>());
      expect(platform.operatingSystem, isA<OperatingSystem>());
      expect(platform.type, isA<HostPlatformType>());
      expect(platform.version, isA<String>());
      expect(platform.isAndroid, isA<bool>());
      expect(platform.isWindows, isA<bool>());
      expect(platform.isFuchsia, isA<bool>());
      expect(platform.isIOS, isA<bool>());
      expect(platform.isLinux, isA<bool>());
      expect(platform.isMacOS, isA<bool>());
    });

    test('identical', () {
      final platform1 = Platform.I;
      final platform2 = Platform.instance;
      final platform3 = platform;
      expect(platform1 == platform2, true);
      expect(platform2 == platform3, true);
      expect(identical(platform1, platform2), true);
      expect(identical(platform2, platform3), true);
      expect(platform1, platform2);
      expect(platform2, platform3);
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
      expect(() => DefaultHostPlatform(), returnsNormally);
      expect(stubPlatform, const DefaultHostPlatform());
      expect(stubPlatform.operatingSystem, OperatingSystem.unknown);
      expect(stubPlatform.numberOfProcessors, 0);
      expect(stubPlatform.locale, 'en');
      expect(stubPlatform.version, '<unknown>');
      expect(stubPlatform.type, type);
    });
  });

  group('platform test', () {
    test('unknown environment', () {
      runZoned(
        () {
          final platform = DefaultHostPlatform();
          expect(platform.operatingSystem, OperatingSystem.unknown);
          expect(platform.numberOfProcessors, 0);
          expect(platform.locale, 'en');
          expect(platform.version, '<unknown>');
          expect(
              platform.type,
              anyOf(
                HostPlatformType.io,
                HostPlatformType.web,
              ));
        },
        zoneValues: {#platform_info_test.isUnknownEnvironment: true},
      );
    });
  }, onPlatform: {
    'android': Timeout.factor(2),
    'ios': Timeout.factor(2),
    /* 'browser': const Skip('Not supported on Browser'), */
  });

  group('PlatformMethods', () {
    bool returnTrue() => true;
    bool returnFalse() => false;

    test('Chaining', () {
      expect(
          platform.when<bool?>(
            io: () => platform.when<bool>(
              material: returnTrue,
              cupertino: returnTrue,
              orElse: returnTrue,
            ),
            web: returnTrue,
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

  group('Enum extensions', () {
    test('BuildMode', () {
      expect(BuildMode.release.isRelease, isTrue);
      expect(BuildMode.profile.isProfile, isTrue);
      expect(BuildMode.debug.isDebug, isTrue);
      expect(
        BuildMode.release.maybeWhen(
          orElse: () => false,
          debug: () => false,
          profile: () => false,
          release: () => true,
        ),
        isTrue,
      );
      expect(
        BuildMode.profile.maybeWhen(
          orElse: () => false,
          debug: () => false,
          profile: () => true,
          release: () => false,
        ),
        isTrue,
      );
      expect(
        BuildMode.debug.maybeWhen(
          orElse: () => false,
          debug: () => true,
          profile: () => false,
          release: () => false,
        ),
        isTrue,
      );
      expect(
        BuildMode.debug.maybeWhen(
          orElse: () => true,
          release: () => false,
          profile: () => false,
        ),
        isTrue,
      );
    });

    test('HostPlatformType', () {
      expect(HostPlatformType.io.isIO, isTrue);
      expect(HostPlatformType.web.isWeb, isTrue);
      expect(
        HostPlatformType.io.when(
          io: () => true,
          web: () => false,
        ),
        isTrue,
      );
      expect(
        HostPlatformType.web.when(
          io: () => false,
          web: () => true,
        ),
        isTrue,
      );
    });

    test('OperatingSystem', () {
      expect(OperatingSystem.fuchsia.isFuchsia, isTrue);
      expect(OperatingSystem.unknown.isUnknown, isTrue);
      expect(OperatingSystem.android.isAndroid, isTrue);
      expect(OperatingSystem.iOS.isIOS, isTrue);
      expect(OperatingSystem.linux.isLinux, isTrue);
      expect(OperatingSystem.macOS.isMacOS, isTrue);
      expect(OperatingSystem.windows.isWindows, isTrue);

      expect(
        OperatingSystem.fuchsia.maybeWhen(
          fuchsia: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        OperatingSystem.windows.maybeWhen(
          windows: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        OperatingSystem.macOS.maybeWhen(
          macOS: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        OperatingSystem.linux.maybeWhen(
          linux: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        OperatingSystem.iOS.maybeWhen(
          iOS: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        OperatingSystem.android.maybeWhen(
          android: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        OperatingSystem.unknown.maybeWhen(
          fuchsia: () => false,
          orElse: () => true,
        ),
        isTrue,
      );
    });
  });
}

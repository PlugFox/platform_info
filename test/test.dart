import 'dart:async';

import 'package:platform_info/platform_info.dart';
import 'package:platform_info/src/default_host_platform.dart';
import 'package:platform_info/src/stub_host_platform.dart' as stub;
import 'package:test/test.dart';

// ignore_for_file: unnecessary_statements, avoid_print, cascade_invocations
// ignore_for_file: unnecessary_lambdas, unnecessary_type_check

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
      expect(platform.js, isA<bool>());
      expect(platform.vm, isA<bool>());
      expect(platform.desktop, isA<bool>());
      expect(platform.mobile, isA<bool>());
      expect(platform.cupertino, isA<bool>());
      expect(platform.material, isA<bool>());
      expect(platform.unknown, isA<bool>());
      expect(platform.locale, isA<String>());
      expect(platform.numberOfProcessors, isA<int>());
      expect(platform.operatingSystem, isA<OperatingSystem>());
      expect(platform.type, isA<HostPlatformType>());
      expect(platform.version, isA<String>());
      expect(platform.android, isA<bool>());
      expect(platform.windows, isA<bool>());
      expect(platform.fuchsia, isA<bool>());
      expect(platform.iOS, isA<bool>());
      expect(platform.linux, isA<bool>());
      expect(platform.macOS, isA<bool>());
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
      expect(Platform.I.toString(), Platform.I.version);
    });
  });

  group('Stub platform', () {
    test('Default values', () {
      final stubPlatform = stub.getHostPlatform();
      const type =
          identical(0, 0.0) ? HostPlatformType.js() : HostPlatformType.vm();
      expect(() => const DefaultHostPlatform(), returnsNormally);
      expect(stubPlatform, isA<DefaultHostPlatform>());
      expect(
          stubPlatform.operatingSystem, same(const OperatingSystem.unknown()));
      expect(stubPlatform.numberOfProcessors, 0);
      expect(stubPlatform.locale, 'en');
      expect(stubPlatform.version, 'unknown');
      expect(stubPlatform.type, type);
    });
  });

  group('platform test', () {
    test('unknown environment', () {
      runZoned(
        () {
          const platform = DefaultHostPlatform();
          expect(
              platform.operatingSystem, same(const OperatingSystem.unknown()));
          expect(platform.numberOfProcessors, 0);
          expect(platform.locale, 'en');
          expect(platform.version, 'unknown');
          expect(
              platform.type,
              anyOf(
                const HostPlatformType.vm(),
                const HostPlatformType.js(),
              ));
        },
        zoneValues: {#platform_info_test.isUnknownEnvironment: true},
      );
    });
  }, onPlatform: {
    'android': const Timeout.factor(2),
    'ios': const Timeout.factor(2),
    /* 'browser': const Skip('Not supported on Browser'), */
  });

  group('PlatformMethods', () {
    bool returnTrue() => true;
    bool returnFalse() => false;

    test('Chaining', () {
      expect(
          platform.when<bool?>(
            vm: () => platform.when<bool>(
              material: returnTrue,
              cupertino: returnTrue,
              orElse: returnTrue,
            ),
            js: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Operating System', () {
      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.fuchsia(),
          ).when(
            fuchsia: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.windows(),
          ).when(
            windows: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.android(),
          ).when(
            android: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.iOS(),
          ).when(
            iOS: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.macOS(),
          ).when(
            macOS: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.linux(),
          ).when(
            linux: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.unknown(),
          ).when(
            unknown: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Design', () {
      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.android(),
          ).when(
            material: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.iOS(),
          ).when(
            cupertino: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Mobile/Desktop', () {
      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.android(),
          ).when(
            mobile: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            operatingSystem: const OperatingSystem.windows(),
          ).when(
            desktop: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('IO or Web', () {
      expect(
          FakePlatform(
            type: const HostPlatformType.vm(),
          ).when(
            vm: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            type: const HostPlatformType.js(),
          ).when(
            js: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);
    });

    test('Build mode', () {
      expect(
          FakePlatform(
            buildMode: const BuildMode.debug(),
          ).when(
            debug: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            buildMode: const BuildMode.profile(),
          ).when(
            profile: returnTrue,
            orElse: returnFalse,
          ),
          isTrue);

      expect(
          FakePlatform(
            buildMode: const BuildMode.release(),
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
      expect(const BuildMode.release().release, isTrue);
      expect(const BuildMode.profile().profile, isTrue);
      expect(const BuildMode.debug().debug, isTrue);
      expect(
        const BuildMode.release().maybeWhen(
          orElse: () => false,
          debug: () => false,
          profile: () => false,
          release: () => true,
        ),
        isTrue,
      );
      expect(
        const BuildMode.profile().maybeWhen(
          orElse: () => false,
          debug: () => false,
          profile: () => true,
          release: () => false,
        ),
        isTrue,
      );
      expect(
        const BuildMode.debug().maybeWhen(
          orElse: () => false,
          debug: () => true,
          profile: () => false,
          release: () => false,
        ),
        isTrue,
      );
      expect(
        const BuildMode.debug().maybeWhen(
          orElse: () => true,
          release: () => false,
          profile: () => false,
        ),
        isTrue,
      );
    });

    test('HostPlatformType', () {
      expect(const HostPlatformType.vm().vm, isTrue);
      expect(const HostPlatformType.js().js, isTrue);
      expect(
        const HostPlatformType.vm().when(
          vm: () => true,
          js: () => false,
        ),
        isTrue,
      );
      expect(
        const HostPlatformType.js().when(
          vm: () => false,
          js: () => true,
        ),
        isTrue,
      );
    });

    test('OperatingSystem', () {
      expect(const OperatingSystem.fuchsia().fuchsia, isTrue);
      expect(const OperatingSystem.unknown().unknown, isTrue);
      expect(const OperatingSystem.android().android, isTrue);
      expect(const OperatingSystem.iOS().iOS, isTrue);
      expect(const OperatingSystem.linux().linux, isTrue);
      expect(const OperatingSystem.macOS().macOS, isTrue);
      expect(const OperatingSystem.windows().windows, isTrue);

      expect(
        const OperatingSystem.fuchsia().maybeWhen(
          fuchsia: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        const OperatingSystem.windows().maybeWhen(
          windows: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        const OperatingSystem.macOS().maybeWhen(
          macOS: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        const OperatingSystem.linux().maybeWhen(
          linux: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        const OperatingSystem.iOS().maybeWhen(
          iOS: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        const OperatingSystem.android().maybeWhen(
          android: () => true,
          orElse: () => false,
        ),
        isTrue,
      );

      expect(
        const OperatingSystem.unknown().maybeWhen(
          fuchsia: () => false,
          orElse: () => true,
        ),
        isTrue,
      );
    });
  });
}

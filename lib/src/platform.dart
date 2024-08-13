// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:meta/meta.dart' show immutable, visibleForTesting;

import 'base_host_platform.dart';
import 'constants.dart';
import 'default_host_platform.dart';
import 'enums.dart';
import 'methods.dart';
import 'stub_host_platform.dart'
    if (dart.library.js_interop) 'js_host_platform.dart'
    if (dart.library.io) 'vm_host_platform.dart';

/// [Platform] info
/// Works on the web, mobile phones, desktops and console.
/// Provides platform information such as:
///   + Build mode
///      * release (release build mode)
///      * profile (profile build mode)
///      * debug (debug build mode)
///
///   + Host platform type
///      * io (desktops, mobile, console)
///      * web (browser)
///
///   + Operation system
///      * Fuchsia
///      * Linux
///      * MacOS
///      * Windows
///      * iOS
///      * Android
///      * Unknown
///
///   + Version
///
///   + Locale string
///
///   + The number of individual execution units of the machine.
///
///   + Operating system is known type
///
///   + Is mobile device (Android, iOS)
///
///   + Is desktop device (Windows, MacOS, Fuchsia)
///
///   + Is material (Android, Fuchsia)
///
///   + Is cupertino (MacOS, iOS)
///
@immutable
final class Platform extends ExtendedHostPlatform with PlatformMethods {
  /// Access to the Singleton instance of Platform
  static Platform get instance => _this;

  /// Short form to access the instance of Platform
  static Platform get I => _this;

  /// Singleton info about platform
  static final Platform _this = Platform._internalFactoryFromEnvironment();

  /// Get current build mode
  static BuildMode _$getCurrentBuildMode() => () {
        if (const bool.fromEnvironment('dart.vm.product')) {
          return const BuildMode.release();
        }
        var result = const BuildMode.profile();
        assert(() {
          result = const BuildMode.debug();
          return true;
        }(), '');
        return result;
      }();

  /// Get host platform
  static HostPlatform _$getHostPlatform() {
    try {
      return getHostPlatform();
    } on Object {
      return const DefaultHostPlatform();
    }
  }

  /// Internal factory from environment
  factory Platform._internalFactoryFromEnvironment() => Platform._internal(
        buildMode: _$getCurrentBuildMode(),
        hostPlatform: _$getHostPlatform(),
      );

  /// Internal constructor
  Platform._internal({
    required this.buildMode,
    required HostPlatform hostPlatform,
  })  : _hostPlatform = hostPlatform,
        mobile = kListOSForMobile.contains(hostPlatform.operatingSystem),
        desktop = kListOSForDesktop.contains(hostPlatform.operatingSystem),
        material =
            kListOSWithMaterialDesign.contains(hostPlatform.operatingSystem),
        cupertino =
            kListOSWithCupertinoDesign.contains(hostPlatform.operatingSystem);

  @override
  HostPlatformType get type => _hostPlatform.type;

  @override
  OperatingSystem get operatingSystem => _hostPlatform.operatingSystem;

  @override
  String get version => _hostPlatform.version;

  @override
  String get locale => _hostPlatform.locale;

  @override
  int get numberOfProcessors => _hostPlatform.numberOfProcessors;

  @override
  bool get js => _hostPlatform.type.js;

  @override
  bool get vm => _hostPlatform.type.vm;

  @override
  final bool mobile;

  @override
  final bool desktop;

  @override
  final bool material;

  @override
  final bool cupertino;

  @override
  bool get android => operatingSystem.android;

  @override
  bool get fuchsia => operatingSystem.fuchsia;

  @override
  bool get iOS => operatingSystem.iOS;

  @override
  bool get linux => operatingSystem.linux;

  @override
  bool get macOS => operatingSystem.macOS;

  @override
  bool get windows => operatingSystem.windows;

  @override
  bool get unknown => operatingSystem.unknown;

  @override
  final BuildMode buildMode;

  /// Host platform contain info about host device
  final HostPlatform _hostPlatform;

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is Platform;

  @override
  String toString() => version;
}

/// Fake class for test needs
@immutable
@visibleForTesting
final class FakePlatform extends Platform {
  /// Fake constructor for test needs
  FakePlatform({
    BuildMode? buildMode,
    HostPlatformType? type,
    OperatingSystem? operatingSystem,
    String? version,
    String? locale,
    int? numberOfProcessors,
  }) : super._internal(
          buildMode: buildMode ?? const BuildMode.debug(),
          hostPlatform: _FakeHostPlatform(
            type: type ?? const DefaultHostPlatform().type,
            operatingSystem:
                operatingSystem ?? const DefaultHostPlatform().operatingSystem,
            version: version ?? const DefaultHostPlatform().version,
            locale: locale ?? const DefaultHostPlatform().locale,
            numberOfProcessors: numberOfProcessors ??
                const DefaultHostPlatform().numberOfProcessors,
          ),
        );
}

/// Fake class for test needs
@immutable
final class _FakeHostPlatform extends HostPlatform {
  /// Fake constructor for test needs
  const _FakeHostPlatform({
    required this.locale,
    required this.numberOfProcessors,
    required this.operatingSystem,
    required this.type,
    required this.version,
  });

  @override
  final String locale;

  @override
  final int numberOfProcessors;

  @override
  final OperatingSystem operatingSystem;

  @override
  final HostPlatformType type;

  @override
  final String version;
}

// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:meta/meta.dart' show immutable, visibleForTesting;

import 'base_host_platform.dart';
import 'constants.dart';
import 'default_host_platform.dart';
import 'enums.dart';
import 'methods.dart';
import 'stub_host_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'web_host_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'io_host_platform.dart';

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
  final bool isOperatingSystemKnown;

  @override
  bool get isWeb => _hostPlatform.type == HostPlatformType.web;

  @override
  bool get isIO => _hostPlatform.type == HostPlatformType.io;

  @override
  final bool isMobile;

  @override
  final bool isDesktop;

  @override
  final bool isMaterial;

  @override
  final bool isCupertino;

  @override
  bool get isAndroid => operatingSystem == OperatingSystem.android;

  @override
  bool get isFuchsia => operatingSystem == OperatingSystem.fuchsia;

  @override
  bool get isIOS => operatingSystem == OperatingSystem.iOS;

  @override
  bool get isLinux => operatingSystem == OperatingSystem.linux;

  @override
  bool get isMacOS => operatingSystem == OperatingSystem.macOS;

  @override
  bool get isWindows => operatingSystem == OperatingSystem.windows;

  @override
  final BuildMode buildMode;

  /// Host platform contain info about host device
  final HostPlatform _hostPlatform;

  static BuildMode _getCurrentBuildMode() => () {
        if (const bool.fromEnvironment('dart.vm.product')) {
          return BuildMode.release;
        }
        var result = BuildMode.profile;
        assert(() {
          result = BuildMode.debug;
          return true;
        }(), '');
        return result;
      }();

  static HostPlatform _getHostPlatform() => getHostPlatform();

  /// Access to the Singleton instance of Platform
  static Platform get instance => _this;

  /// Short form to access the instance of Platform
  static Platform get I => _this;

  /// Singleton info about platform
  static final Platform _this = Platform._internalFactoryFromEnvironment();

  /// Internal factory from environment
  factory Platform._internalFactoryFromEnvironment() => Platform._internal(
        buildMode: _getCurrentBuildMode(),
        hostPlatform: _getHostPlatform(),
      );

  /// Internal constructor
  Platform._internal({
    required this.buildMode,
    required HostPlatform hostPlatform,
  })  : _hostPlatform = hostPlatform,
        isOperatingSystemKnown =
            hostPlatform.operatingSystem != OperatingSystem.unknown,
        isMobile = kListOSForMobile.contains(hostPlatform.operatingSystem),
        isDesktop = kListOSForDesktop.contains(hostPlatform.operatingSystem),
        isMaterial =
            kListOSWithMaterialDesign.contains(hostPlatform.operatingSystem),
        isCupertino =
            kListOSWithCupertinoDesign.contains(hostPlatform.operatingSystem);

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is Platform;

  @override
  String toString() => '<Platform $version>';
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
          buildMode: buildMode ?? BuildMode.debug,
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

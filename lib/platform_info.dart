// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

library platform_info;

import 'src/base_host_platform.dart';
import 'src/enums.dart';
import 'src/stub_host_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'src/web_host_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'src/io_host_platform.dart';

export 'src/enums.dart';

/// [Platform] info
/// Works on the web, mobile phones, desktops and console.
/// Provides platform information such as:
///   + Build mode
///      * release
///      * profile
///      * debug
///
///   + Host platform type
///      * io
///      * web
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
///
class Platform {
  /// Build mode
  ///  + release - Release build mode
  ///  + profile - Profile build mode
  ///  + debug   - Debug build mode
  final BuildMode buildMode;

  /// Host platform type
  ///  + io
  ///  + web
  HostPlatformType get type => _hostPlatform.type;

  /// Operation system
  ///  + Fuchsia
  ///  + Linux
  ///  + MacOS
  ///  + Windows
  ///  + iOS
  ///  + Android
  ///  + Unknown
  OperatingSystem get operatingSystem => _hostPlatform.operatingSystem;

  /// Version
  ///  in i/o - operating system version
  ///  in Web - userAgent string
  String get version => _hostPlatform.version;

  /// Locale string
  String get locale => _hostPlatform.locale;

  /// The number of individual execution units of the machine.
  /// 0 if unknown
  int get numberOfProcessors => _hostPlatform.numberOfProcessors;

  /// Operating system is known type
  bool get isOperatingSystemKnown => _isOperatingSystemKnown;
  bool _isOperatingSystemKnown;

  /// Is mobile device (Android, iOS)
  bool get isMobile => _isMobile;
  bool _isMobile;

  /// Is desktop device (Windows, MacOS, Fuchsia)
  bool get isDesktop => _isDesktop;
  bool _isDesktop;

  /// Is material (Android, Fuchsia)
  bool get isMaterial => _isMaterial;
  bool _isMaterial;

  /// Is cupertino (MacOS, iOS)
  bool get isCupertino => _isCupertino;
  bool _isCupertino;

  /// Host platform
  /// contain info about host device
  final HostPlatform _hostPlatform;

  static BuildMode _getCurrentBuildMode() => (() {
        if (const bool.fromEnvironment('dart.vm.product')) {
          return BuildMode.release;
        }
        BuildMode result = BuildMode.profile;
        assert(() {
          result = BuildMode.debug;
          return true;
        }());
        return result;
      }());

  static HostPlatform _getHostPlatform() => getHostPlatform();

  @override
  int get hashCode => 0;
  @override
  bool operator ==(Object obj) => obj is Platform;
  @override
  String toString() => version;

  /// Singleton info about platform
  factory Platform() => _this;
  static final Platform _this = Platform._internal();
  Platform._internal()
      : _hostPlatform = _getHostPlatform(),
        buildMode = _getCurrentBuildMode() {
    _isOperatingSystemKnown = operatingSystem != OperatingSystem.unknown;
    _isMobile = <OperatingSystem>[OperatingSystem.android, OperatingSystem.iOS]
        .contains(operatingSystem);
    _isDesktop = <OperatingSystem>[
      OperatingSystem.windows,
      OperatingSystem.macOS,
      OperatingSystem.fuchsia
    ].contains(operatingSystem);
    _isMaterial = <OperatingSystem>[
      OperatingSystem.android,
      OperatingSystem.fuchsia
    ].contains(operatingSystem);
    _isCupertino = <OperatingSystem>[OperatingSystem.macOS, OperatingSystem.iOS]
        .contains(operatingSystem);
  }

  /// To JSON map<String, dynamic>
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buildMode': buildMode.index,
        'type': type.index,
        'operatingSystem': operatingSystem.index,
        'version': version,
        'locale': locale,
        'numberOfProcessors': numberOfProcessors,
        'isOperatingSystemKnown': isOperatingSystemKnown,
        'isMobile': isMobile,
        'isDesktop': isDesktop,
        'isMaterial': isMaterial,
        'isCupertino': isCupertino,
      };
}

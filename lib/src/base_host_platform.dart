import 'enums.dart';

/// Host platform
/// contain info about host device
abstract class HostPlatform {
  /// Host platform type
  ///  + io
  ///  + web
  HostPlatformType get type;

  /// Operation system
  ///  + Fuchsia
  ///  + Linux
  ///  + MacOS
  ///  + Windows
  ///  + iOS
  ///  + Android
  ///  + Unknown
  OperatingSystem get operatingSystem;

  /// Version
  ///  in i/o - operating system version
  ///  in Web - user agent string
  String get version;

  /// Locale string
  String get locale;

  /// The number of individual execution units of the machine
  /// Returns 0 if unknown or not available
  /// Use `.gcd(1)` if you need a quantity greater than 0
  int get numberOfProcessors;
}

/// Extended host platform
abstract class ExtendedHostPlatform implements HostPlatform {
  /// Operating system is known type
  bool get isOperatingSystemKnown;

  /// Is mobile device (Android, iOS)
  bool get isMobile;

  /// Is desktop device (Windows, MacOS, Fuchsia)
  bool get isDesktop;

  /// Is material (Android, Fuchsia)
  bool get isMaterial;

  /// Is cupertino (MacOS, iOS)
  bool get isCupertino;

  /// Whether the operating system is a version of
  /// [Linux](https://en.wikipedia.org/wiki/Linux)
  ///
  /// This value is `false` if the operating system is a specialized
  /// version of Linux that identifies itself by a different name,
  /// for example Android (see [isAndroid])
  bool get isLinux;

  /// Whether the operating system is a version of
  /// [macOS](https://en.wikipedia.org/wiki/MacOS)
  bool get isMacOS;

  /// Whether the operating system is a version of
  /// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
  bool get isWindows;

  /// Whether the operating system is a version of
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29)
  bool get isAndroid;

  /// Whether the operating system is a version of
  /// [iOS](https://en.wikipedia.org/wiki/IOS)
  bool get isIOS;

  /// Whether the operating system is a version of
  /// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia)
  bool get isFuchsia;

  /// Build mode
  ///  + release - Release build mode
  ///  + profile - Profile build mode
  ///  + debug   - Debug build mode
  BuildMode get buildMode;
}

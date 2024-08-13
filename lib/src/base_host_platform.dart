import 'package:meta/meta.dart' show immutable;

import 'enums.dart';

/// Host platform
/// contain info about host device
@immutable
abstract base class HostPlatform {
  /// A constant constructor to allow subclasses to be const.
  const HostPlatform();

  /// Host platform type
  ///  + io
  ///  + web
  abstract final HostPlatformType type;

  /// Operation system
  ///  + Fuchsia
  ///  + Linux
  ///  + MacOS
  ///  + Windows
  ///  + iOS
  ///  + Android
  ///  + Unknown
  abstract final OperatingSystem operatingSystem;

  /// Version
  ///  in i/o - operating system version
  ///  in Web - user agent string
  abstract final String version;

  /// Locale string
  abstract final String locale;

  /// The number of individual execution units of the machine
  /// Returns 0 if unknown or not available
  /// Use `.clamp(1, double.infinity)` if you need a quantity greater than 0
  abstract final int numberOfProcessors;
}

/// Extended host platform
abstract base class ExtendedHostPlatform extends HostPlatform {
  /// A constant constructor to allow subclasses to be const.
  const ExtendedHostPlatform();

  /// Is web-based applications
  abstract final bool js;

  /// Is I/O supporting for non-web applications
  abstract final bool vm;

  /// Is mobile device (Android, iOS)
  abstract final bool mobile;

  /// Is desktop device (Windows, MacOS, Fuchsia)
  abstract final bool desktop;

  /// Is material (Android, Fuchsia)
  abstract final bool material;

  /// Is cupertino (MacOS, iOS)
  abstract final bool cupertino;

  /// Whether the operating system is a version of
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29)
  abstract final bool android;

  /// Whether the operating system is a version of
  /// [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia)
  abstract final bool fuchsia;

  /// Whether the operating system is a version of
  /// [iOS](https://en.wikipedia.org/wiki/IOS)
  abstract final bool iOS;

  /// Whether the operating system is a version of
  /// [Linux](https://en.wikipedia.org/wiki/Linux)
  ///
  /// This value is `false` if the operating system is a specialized
  /// version of Linux that identifies itself by a different name,
  /// for example Android (see [android])
  abstract final bool linux;

  /// Whether the operating system is a version of
  /// [macOS](https://en.wikipedia.org/wiki/MacOS)
  abstract final bool macOS;

  /// Whether the operating system is a version of
  /// [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
  abstract final bool windows;

  /// Unknown operating system
  abstract final bool unknown;

  /// Build mode
  ///  + release - Release build mode
  ///  + profile - Profile build mode
  ///  + debug   - Debug build mode
  abstract final BuildMode buildMode;
}

import 'enums.dart';

/// Host platform
/// contain info about host device
abstract class HostPlatform {
  /// Host platform type
  final HostPlatformType type = HostPlatformType.io;

  /// Operating system
  final OperatingSystem operatingSystem = OperatingSystem.unknown;

  /// Version
  ///  in i/o - operating system version
  ///  in Web - userAgent string
  final String version = 'unknown';

  /// Locale string
  final String locale = 'en';

  /// The number of individual execution units of the machine.
  /// 0 if unknown
  final int numberOfProcessors = 0;
}

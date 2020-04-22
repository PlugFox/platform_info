import 'dart:io' as io show Platform;
import 'base_host_platform.dart';
import 'enums.dart';

/// Get host platform if dart.library.io available
HostPlatform getHostPlatform() => IOHostPlatform();

/// i/o based host platform
class IOHostPlatform implements HostPlatform {
  @override
  final HostPlatformType type = HostPlatformType.io;

  @override
  final OperatingSystem operatingSystem = _getOS();

  @override
  final String version = _getVersion();

  @override
  final String locale = _getLocale();

  @override
  int numberOfProcessors = _numberOfProcessors();

  static OperatingSystem _getOS() {
    if (io.Platform.isFuchsia) {
      return OperatingSystem.fuchsia;
    } else if (io.Platform.isWindows) {
      return OperatingSystem.windows;
    } else if (io.Platform.isAndroid) {
      return OperatingSystem.android;
    } else if (io.Platform.isMacOS) {
      return OperatingSystem.macOS;
    } else if (io.Platform.isIOS) {
      return OperatingSystem.iOS;
    } else if (io.Platform.isLinux) {
      return OperatingSystem.linux;
    }
    return OperatingSystem.unknown;
  }

  static String _getVersion() =>
      io.Platform?.operatingSystemVersion ?? 'unknown';

  static int _numberOfProcessors() => io.Platform?.numberOfProcessors ?? 0;

  static String _getLocale() {
    String lang = io.Platform.localeName
        ?.split('-')
        ?.first
        ?.split('_')
        ?.first
        ?.trim()
        ?.toLowerCase();
    if (lang is! String || lang.length != 2) return 'en';
    return lang;
  }
}

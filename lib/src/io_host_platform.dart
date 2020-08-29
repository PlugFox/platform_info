import 'dart:async';
import 'dart:io' as io show Platform;

import 'base_host_platform.dart';
import 'constants.dart';
import 'enums.dart';

/// Get host platform if dart.library.io available
HostPlatform getHostPlatform() => _IOHostPlatform._();

/// i/o based host platform
class _IOHostPlatform implements HostPlatform {
  _IOHostPlatform._();

  static bool get _isUnknownEnvironment =>
      Zone.current[#platform_info_test.isUnknownEnvironment] as bool ?? false;

  static bool get _isKnownEnvironment => !_isUnknownEnvironment;

  @override
  final HostPlatformType type = HostPlatformType.io;

  @override
  final OperatingSystem operatingSystem = _getOS();

  @override
  final String version = _getVersion();

  @override
  final String locale = _getLocale();

  @override
  final int numberOfProcessors = _numberOfProcessors();

  static OperatingSystem _getOS() {
    if (_isKnownEnvironment) {
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
    }
    return kDefaultHostPlatform.operatingSystem;
  }

  static String _getVersion() {
    if (_isKnownEnvironment) {
      final operatingSystemVersion = io.Platform?.operatingSystemVersion;
      if (operatingSystemVersion != null) {
        return operatingSystemVersion;
      }
    }
    return kDefaultHostPlatform.version;
  }

  static int _numberOfProcessors() {
    if (_isKnownEnvironment) {
      final numberOfProcessors = io.Platform?.numberOfProcessors;
      if (numberOfProcessors != null) {
        return numberOfProcessors;
      }
    }
    return kDefaultHostPlatform.numberOfProcessors;
  }

  static String _getLocale() {
    final lang = io.Platform.localeName
        ?.split('-')
        ?.first
        ?.split('_')
        ?.first
        ?.trim()
        ?.toLowerCase();
    if (_isUnknownEnvironment || lang is! String || lang.length != 2) {
      return kDefaultHostPlatform.locale;
    }
    return lang;
  }
}

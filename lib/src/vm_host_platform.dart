import 'dart:async';
import 'dart:io' as io;

import 'base_host_platform.dart';
import 'constants.dart';
import 'enums.dart';

/// Get host platform if dart.library.io available
HostPlatform getHostPlatform() => _HostPlatform$IO._();

/// i/o based host platform
final class _HostPlatform$IO extends HostPlatform {
  _HostPlatform$IO._()
      : operatingSystem = _getOS(),
        version = _getVersion(),
        locale = _getLocale(),
        numberOfProcessors = _numberOfProcessors();

  static bool get _isUnknownEnvironment =>
      Zone.current[#platform_info_test.isUnknownEnvironment] as bool? ?? false;

  static bool get _isKnownEnvironment => !_isUnknownEnvironment;

  static OperatingSystem _getOS() {
    if (_isKnownEnvironment) {
      if (io.Platform.fuchsia) {
        return const OperatingSystem.fuchsia();
      } else if (io.Platform.windows) {
        return const OperatingSystem.windows();
      } else if (io.Platform.android) {
        return const OperatingSystem.android();
      } else if (io.Platform.macOS) {
        return const OperatingSystem.macOS();
      } else if (io.Platform.iOS) {
        return const OperatingSystem.iOS();
      } else if (io.Platform.linux) {
        return const OperatingSystem.linux();
      }
    }
    return kDefaultHostPlatform.operatingSystem;
  }

  static String _getVersion() => _isKnownEnvironment
      ? io.Platform.operatingSystemVersion
      : kDefaultHostPlatform.version;

  static int _numberOfProcessors() => _isKnownEnvironment
      ? io.Platform.numberOfProcessors
      : kDefaultHostPlatform.numberOfProcessors;

  static String _getLocale() {
    final lang = io.Platform.localeName
        .split('-')
        .first
        .split('_')
        .first
        .trim()
        .toLowerCase();
    if (_isUnknownEnvironment || lang.length != 2) {
      return kDefaultHostPlatform.locale;
    }
    return lang;
  }

  @override
  final HostPlatformType type = const HostPlatformType.vm();

  @override
  final OperatingSystem operatingSystem;

  @override
  final String version;

  @override
  final String locale;

  @override
  final int numberOfProcessors;
}

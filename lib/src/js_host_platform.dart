import 'dart:async';

import 'package:meta/meta.dart' show immutable, internal;
import 'package:web/web.dart' as web show window;

import 'base_host_platform.dart';
import 'constants.dart';
import 'enums.dart';

/// Get host platform if dart.library.js_interop available
@internal
HostPlatform getHostPlatform() => _HostPlatform$Web._();

/// Web based host platform
@immutable
final class _HostPlatform$Web extends HostPlatform {
  _HostPlatform$Web._()
      : type = const HostPlatformType.js(),
        operatingSystem = _getOS(),
        version = _getVersion(),
        locale = _getLocale(),
        numberOfProcessors = _numberOfProcessors();

  static bool get _isUnknownEnvironment =>
      Zone.current[#platform_info_test.isUnknownEnvironment] as bool? ?? false;

  static bool get _isKnownEnvironment => !_isUnknownEnvironment;

  static OperatingSystem _getOS() {
    if (_isKnownEnvironment) {
      final appVersion = _getVersion().toLowerCase();
      if (appVersion.contains('fuchsia')) {
        return const OperatingSystem.fuchsia();
      } else if (appVersion.contains('mac')) {
        return const OperatingSystem.macOS();
      } else if (appVersion.contains('win')) {
        return const OperatingSystem.windows();
      } else if (appVersion.contains('android')) {
        return const OperatingSystem.android();
      } else if (appVersion.contains('iphone')) {
        return const OperatingSystem.iOS();
      } else if (appVersion.contains('ios')) {
        return const OperatingSystem.iOS();
      } else if (appVersion.contains('linux')) {
        return const OperatingSystem.linux();
      }
    }
    return kDefaultHostPlatform.operatingSystem;
  }

  static String _getVersion() => <String>[
        web.window.navigator.userAgent,
        web.window.navigator.appVersion,
        web.window.navigator.platform,
      ].firstWhere(
        (v) => _isKnownEnvironment && v.isNotEmpty,
        orElse: () => kDefaultHostPlatform.version,
      );

  static int _numberOfProcessors() => _isKnownEnvironment
      ? web.window.navigator.hardwareConcurrency
      : kDefaultHostPlatform.numberOfProcessors;

  static String _getLocale() {
    final lang = web.window.navigator.language
        .split('-')
        .first
        .split('_')
        .first
        .trim()
        .toLowerCase();
    return _isUnknownEnvironment || lang.length != 2
        ? kDefaultHostPlatform.locale
        : lang;
  }

  @override
  final HostPlatformType type;

  @override
  final OperatingSystem operatingSystem;

  @override
  final String version;

  @override
  final String locale;

  @override
  final int numberOfProcessors;
}

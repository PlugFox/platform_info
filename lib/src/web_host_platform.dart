import 'dart:async';
import 'dart:html' as html show window;

import 'package:meta/meta.dart' show immutable, internal;

import 'base_host_platform.dart';
import 'constants.dart';
import 'enums.dart';

/// Get host platform if dart.library.html available
@internal
HostPlatform getHostPlatform() => _HostPlatform$Web._();

/// Web based host platform
@immutable
final class _HostPlatform$Web extends HostPlatform {
  _HostPlatform$Web._();

  static bool get _isUnknownEnvironment =>
      Zone.current[#platform_info_test.isUnknownEnvironment] as bool? ?? false;

  static bool get _isKnownEnvironment => !_isUnknownEnvironment;

  @override
  final HostPlatformType type = HostPlatformType.web;

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
      final appVersion = _getVersion().toLowerCase();
      if (appVersion.contains('fuchsia')) {
        return OperatingSystem.fuchsia;
      } else if (appVersion.contains('mac')) {
        return OperatingSystem.macOS;
      } else if (appVersion.contains('win')) {
        return OperatingSystem.windows;
      } else if (appVersion.contains('android')) {
        return OperatingSystem.android;
      } else if (appVersion.contains('iphone')) {
        return OperatingSystem.iOS;
      } else if (appVersion.contains('ios')) {
        return OperatingSystem.iOS;
      } else if (appVersion.contains('linux')) {
        return OperatingSystem.linux;
      }
    }
    return kDefaultHostPlatform.operatingSystem;
  }

  static String _getVersion() => <String>[
        html.window.navigator.userAgent,
        html.window.navigator.appVersion,
        html.window.navigator.platform ?? '',
      ].firstWhere(
        (v) => _isKnownEnvironment && v.isNotEmpty,
        orElse: () => kDefaultHostPlatform.version,
      );

  static int _numberOfProcessors() {
    if (_isKnownEnvironment) {
      final numberOfProcessors = html.window.navigator.hardwareConcurrency;
      if (numberOfProcessors != null) {
        return numberOfProcessors;
      }
    }
    return kDefaultHostPlatform.numberOfProcessors;
  }

  static String _getLocale() {
    final lang = html.window.navigator.language
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
}

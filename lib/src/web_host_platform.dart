import 'dart:html' as html show window;
import 'base_host_platform.dart';
import 'enums.dart';

/// Get host platform if dart.library.html available
HostPlatform getHostPlatform() => WebHostPlatform();

/// Web based host platform
class WebHostPlatform implements HostPlatform {
  @override
  final HostPlatformType type = HostPlatformType.web;

  @override
  final OperatingSystem operatingSystem = _getOS();

  @override
  final String version = _getVersion();

  @override
  final String locale = _getLocale();

  @override
  int numberOfProcessors = _numberOfProcessors();

  static OperatingSystem _getOS() {
    final String appVersion = _getVersion().toLowerCase();
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
    return OperatingSystem.unknown;
  }

  static String _getVersion() =>
      html.window?.navigator?.userAgent ??
      html.window?.navigator?.appVersion ??
      'unknown';

  static int _numberOfProcessors() =>
      html.window?.navigator?.hardwareConcurrency ?? 0;

  static String _getLocale() {
    String lang = html.window.navigator.language
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

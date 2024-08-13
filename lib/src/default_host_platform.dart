import 'package:meta/meta.dart' show immutable, literal;

import 'base_host_platform.dart' show HostPlatform;
import 'enums.dart';

/// Unknown host platform with default values
@immutable
final class DefaultHostPlatform extends HostPlatform {
  /// Unknown host platform with default values
  @literal
  const DefaultHostPlatform();

  @override
  HostPlatformType get type => identical(0, 0.0)
      ? const HostPlatformType.js()
      : const HostPlatformType.vm();

  @override
  OperatingSystem get operatingSystem => const OperatingSystem.unknown();

  @override
  String get version => 'unknown';

  @override
  String get locale => 'en';

  @override
  int get numberOfProcessors => 0;
}

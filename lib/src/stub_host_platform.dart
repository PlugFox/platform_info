import 'package:meta/meta.dart' show immutable;

import 'base_host_platform.dart';
import 'enums.dart';

/// Get host platform if dart.library.html and dart.library.io available
HostPlatform getHostPlatform() => const DefaultHostPlatform();

/// Unknown host platform with default values
@immutable
class DefaultHostPlatform implements HostPlatform {
  /// Unknown host platform with default values
  const DefaultHostPlatform();

  @override
  HostPlatformType get type =>
      identical(0, 0.0) ? HostPlatformType.web : HostPlatformType.io;

  @override
  OperatingSystem get operatingSystem => OperatingSystem.unknown;

  @override
  String get version => '<unknown>';

  @override
  String get locale => 'en';

  @override
  int get numberOfProcessors => 0;
}

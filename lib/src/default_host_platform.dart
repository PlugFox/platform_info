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

import 'base_host_platform.dart';
import 'enums.dart';

/// Get host platform if dart.library.html and dart.library.io available
HostPlatform getHostPlatform() => const UnknownHostPlatform();

/// Unknown host platform
class UnknownHostPlatform implements HostPlatform {
  /// Unknown host platform constructor
  const UnknownHostPlatform();

  @override
  final HostPlatformType type =
      identical(0, 0.0) ? HostPlatformType.web : HostPlatformType.io;

  @override
  final OperatingSystem operatingSystem = OperatingSystem.unknown;

  @override
  final String version = 'unknown';

  @override
  final String locale = 'en';

  @override
  final int numberOfProcessors = 0;
}

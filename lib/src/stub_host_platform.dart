import 'base_host_platform.dart';
import 'default_host_platform.dart';

/// Get host platform if dart.library.html and dart.library.io available
/// Return unknown host platform with default values
HostPlatform getHostPlatform() => const DefaultHostPlatform();

/// Build mode enum
///  + release - Release build mode
///  + profile - Profile build mode
///  + debug   - Debug build mode
enum BuildMode {
  /// Release build mode
  release,

  /// Profile build mode
  profile,

  /// Debug build mode
  debug
}

/// Host platform type
///  + io
///  + web
enum HostPlatformType {
  /// IO
  io,

  /// Web
  web,
}

/// Operation system
///  + Fuchsia
///  + Linux
///  + MacOS
///  + Windows
///  + iOS
///  + Android
///  + Unknown
enum OperatingSystem {
  /// Fuchsia
  fuchsia,

  /// Linux
  linux,

  /// MacOS
  macOS,

  /// Windows
  windows,

  /// iOS
  iOS,

  /// Android
  android,

  /// Unknown
  unknown,
}

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
///  + io (vm, desktops, mobile, console)
///  + web (html, js, browser)
enum HostPlatformType {
  /// IO (desktops, mobile, console)
  io,

  /// Web (browser)
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
  /// Unknown
  unknown,

  /// Windows
  windows,

  /// Linux
  linux,

  /// MacOS
  macOS,

  /// iOS
  iOS,

  /// Android
  android,

  /// Fuchsia
  fuchsia,
}

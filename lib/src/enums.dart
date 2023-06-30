/// Build mode enum
///  + release - Release build mode
///  + profile - Profile build mode
///  + debug   - Debug build mode
enum BuildMode {
  /// Release build mode
  release(),

  /// Profile build mode
  profile(),

  /// Debug build mode
  debug();

  /// Build mode enum
  const BuildMode();

  /// Is release build mode
  bool get isRelease => this == BuildMode.release;

  /// Is profile build mode
  bool get isProfile => this == BuildMode.profile;

  /// Is debug build mode
  bool get isDebug => this == BuildMode.debug;

  /// Run callback on specific build mode
  BuildModeResult when<BuildModeResult extends Object?>({
    required BuildModeResult Function() release,
    required BuildModeResult Function() profile,
    required BuildModeResult Function() debug,
  }) =>
      switch (this) {
        BuildMode.profile => profile(),
        BuildMode.debug => debug(),
        BuildMode.release => release(),
      };

  /// Run callback on specific build mode,
  /// if not specified run orElse
  BuildModeResult maybeWhen<BuildModeResult extends Object?>({
    required BuildModeResult Function() orElse,
    BuildModeResult Function()? release,
    BuildModeResult Function()? profile,
    BuildModeResult Function()? debug,
  }) =>
      when<BuildModeResult>(
        debug: debug ?? orElse,
        profile: profile ?? orElse,
        release: release ?? orElse,
      );
}

/// Host platform type
///  + io (vm, desktops, mobile, console)
///  + web (html, js, browser)
enum HostPlatformType {
  /// IO (desktops, mobile, console)
  io(),

  /// Web (browser)
  web();

  /// Host platform type
  const HostPlatformType();

  /// Is I/O (vm, desktops, mobile, console)
  bool get isIO => this == HostPlatformType.io;

  /// Is Web (html, js, browser)
  bool get isWeb => this == HostPlatformType.web;

  /// Run callback on specific host platform
  HostPlatformTypeResult when<HostPlatformTypeResult extends Object?>({
    required HostPlatformTypeResult Function() io,
    required HostPlatformTypeResult Function() web,
  }) =>
      this == HostPlatformType.web ? web() : io();
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
  unknown('Unknown'),

  /// Windows
  windows('Windows'),

  /// Linux
  linux('Linux'),

  /// MacOS
  macOS('macOS'),

  /// iOS
  iOS('iOS'),

  /// Android
  android('Android'),

  /// Fuchsia
  fuchsia('Fuchsia');

  /// Operation system
  const OperatingSystem(this.name);

  /// Operation system name
  final String name;

  /// Android
  bool get isAndroid => this == OperatingSystem.android;

  /// Fuchsia
  bool get isFuchsia => this == OperatingSystem.fuchsia;

  /// iOS
  bool get isIOS => this == OperatingSystem.iOS;

  /// Linux
  bool get isLinux => this == OperatingSystem.linux;

  /// MacOS
  bool get isMacOS => this == OperatingSystem.macOS;

  /// Windows
  bool get isWindows => this == OperatingSystem.windows;

  /// Unknown
  bool get isUnknown => this == OperatingSystem.unknown;

  /// Run callback on specific operation system
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      switch (this) {
        OperatingSystem.android => android(),
        OperatingSystem.fuchsia => fuchsia(),
        OperatingSystem.iOS => iOS(),
        OperatingSystem.linux => linux(),
        OperatingSystem.macOS => macOS(),
        OperatingSystem.windows => windows(),
        OperatingSystem.unknown => unknown(),
      };

  /// Run callback on specific operation system,
  /// if not specified run orElse
  OperatingSystemResult maybeWhen<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() orElse,
    OperatingSystemResult Function()? android,
    OperatingSystemResult Function()? fuchsia,
    OperatingSystemResult Function()? iOS,
    OperatingSystemResult Function()? linux,
    OperatingSystemResult Function()? macOS,
    OperatingSystemResult Function()? windows,
  }) =>
      when<OperatingSystemResult>(
        android: android ?? orElse,
        fuchsia: fuchsia ?? orElse,
        iOS: iOS ?? orElse,
        linux: linux ?? orElse,
        macOS: macOS ?? orElse,
        windows: windows ?? orElse,
        unknown: orElse,
      );
}

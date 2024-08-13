import 'package:meta/meta.dart';

/// Build mode enum
///  + debug   - Debug build mode
///  + profile - Profile build mode
///  + release - Release build mode
@immutable
sealed class BuildMode {
  /// Build mode
  const BuildMode();

  /// Build mode: debug
  @literal
  const factory BuildMode.debug() = BuildMode$Debug;

  /// Build mode: profile
  @literal
  const factory BuildMode.profile() = BuildMode$Profile;

  /// Build mode: release
  @literal
  const factory BuildMode.release() = BuildMode$Release;

  /// List of all build modes
  static const List<BuildMode> values = <BuildMode>[
    BuildMode$Debug(),
    BuildMode$Profile(),
    BuildMode$Release(),
  ];

  /// Is debug build mode
  abstract final bool debug;

  /// Is profile build mode
  abstract final bool profile;

  /// Is release build mode
  abstract final bool release;

  /// Run callback on specific build mode
  BuildModeResult when<BuildModeResult extends Object?>({
    required BuildModeResult Function() debug,
    required BuildModeResult Function() profile,
    required BuildModeResult Function() release,
  });

  /// Run callback on specific build mode,
  /// if not specified run orElse
  BuildModeResult maybeWhen<BuildModeResult extends Object?>({
    required BuildModeResult Function() orElse,
    BuildModeResult Function()? debug,
    BuildModeResult Function()? profile,
    BuildModeResult Function()? release,
  }) =>
      when<BuildModeResult>(
        debug: debug ?? orElse,
        profile: profile ?? orElse,
        release: release ?? orElse,
      );
}

/// Build mode: debug
final class BuildMode$Debug extends BuildMode {
  /// Build mode: debug
  @literal
  const BuildMode$Debug();

  @override
  BuildModeResult when<BuildModeResult extends Object?>({
    required BuildModeResult Function() debug,
    required BuildModeResult Function() profile,
    required BuildModeResult Function() release,
  }) =>
      debug();

  @override
  bool get debug => true;

  @override
  bool get profile => false;

  @override
  bool get release => false;

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BuildMode$Debug;

  @override
  String toString() => 'debug';
}

/// Build mode: profile
final class BuildMode$Profile extends BuildMode {
  /// Build mode: profile
  @literal
  const BuildMode$Profile();

  @override
  BuildModeResult when<BuildModeResult extends Object?>({
    required BuildModeResult Function() debug,
    required BuildModeResult Function() profile,
    required BuildModeResult Function() release,
  }) =>
      profile();

  @override
  bool get debug => false;

  @override
  bool get profile => true;

  @override
  bool get release => false;

  @override
  int get hashCode => 1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BuildMode$Profile;

  @override
  String toString() => 'profile';
}

/// Build mode: release
final class BuildMode$Release extends BuildMode {
  /// Build mode: release
  @literal
  const BuildMode$Release();

  @override
  BuildModeResult when<BuildModeResult extends Object?>({
    required BuildModeResult Function() debug,
    required BuildModeResult Function() profile,
    required BuildModeResult Function() release,
  }) =>
      release();

  @override
  bool get debug => false;

  @override
  bool get profile => false;

  @override
  bool get release => true;

  @override
  int get hashCode => 2;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BuildMode$Release;

  @override
  String toString() => 'release';
}

/// Host platform type
///  + io (vm, desktops, mobile, console)
///  + web (html, js, browser)
@immutable
sealed class HostPlatformType {
  /// Host platform type
  const HostPlatformType();

  /// VM (io, vm, desktops, mobile, console)
  @literal
  const factory HostPlatformType.vm() = HostPlatformType$VM;

  /// JS (browser, web, html, js)
  @literal
  const factory HostPlatformType.js() = HostPlatformType$JS;

  /// List of all host platform types
  static const List<HostPlatformType> values = <HostPlatformType>[
    HostPlatformType$VM(),
    HostPlatformType$JS(),
  ];

  /// Is VM (io, vm, desktops, mobile, console)
  abstract final bool vm;

  /// Is JS (browser, web, html, js)
  abstract final bool js;

  /// Run callback on specific host platform
  HostPlatformTypeResult when<HostPlatformTypeResult extends Object?>({
    required HostPlatformTypeResult Function() vm,
    required HostPlatformTypeResult Function() js,
  });
}

/// VM (io, vm, desktops, mobile, console)
final class HostPlatformType$VM extends HostPlatformType {
  /// VM (io, vm, desktops, mobile, console)
  @literal
  const HostPlatformType$VM();

  @override
  HostPlatformTypeResult when<HostPlatformTypeResult extends Object?>({
    required HostPlatformTypeResult Function() vm,
    required HostPlatformTypeResult Function() js,
  }) =>
      vm();

  @override
  bool get vm => true;

  @override
  bool get js => false;

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HostPlatformType$VM;

  @override
  String toString() => 'vm';
}

/// JS (browser, web, html, js)
final class HostPlatformType$JS extends HostPlatformType {
  /// JS (browser, web, html, js)
  @literal
  const HostPlatformType$JS();

  @override
  HostPlatformTypeResult when<HostPlatformTypeResult extends Object?>({
    required HostPlatformTypeResult Function() vm,
    required HostPlatformTypeResult Function() js,
  }) =>
      js();

  @override
  bool get vm => false;

  @override
  bool get js => true;

  @override
  int get hashCode => 1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HostPlatformType$JS;

  @override
  String toString() => 'js';
}

/// Operation system
///  + Fuchsia
///  + Linux
///  + MacOS
///  + Windows
///  + iOS
///  + Android
///  + Unknown
@immutable
sealed class OperatingSystem {
  /// Build mode
  const OperatingSystem();

  /// Android
  @literal
  const factory OperatingSystem.android() = OperatingSystem$Android;

  /// Fuchsia
  @literal
  const factory OperatingSystem.fuchsia() = OperatingSystem$Fuchsia;

  /// iOS
  @literal
  const factory OperatingSystem.iOS() = OperatingSystem$iOS;

  /// Linux
  @literal
  const factory OperatingSystem.linux() = OperatingSystem$Linux;

  /// MacOS
  @literal
  const factory OperatingSystem.macOS() = OperatingSystem$MacOS;

  /// Windows
  @literal
  const factory OperatingSystem.windows() = OperatingSystem$Windows;

  /// Unknown
  @literal
  const factory OperatingSystem.unknown() = OperatingSystem$Unknown;

  /// List of all operation systems
  static const List<OperatingSystem> values = <OperatingSystem>[
    OperatingSystem$Android(),
    OperatingSystem$Fuchsia(),
    OperatingSystem$iOS(),
    OperatingSystem$Linux(),
    OperatingSystem$MacOS(),
    OperatingSystem$Windows(),
    OperatingSystem$Unknown(),
  ];

  /// Operation system name
  abstract final String name;

  /// Android
  abstract final bool android;

  /// Fuchsia
  abstract final bool fuchsia;

  /// iOS
  abstract final bool iOS;

  /// Linux
  abstract final bool linux;

  /// MacOS
  abstract final bool macOS;

  /// Windows
  abstract final bool windows;

  /// Unknown
  abstract final bool unknown;

  /// Run callback on specific operation system
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  });

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

  @override
  String toString() => name;
}

/// Android
final class OperatingSystem$Android extends OperatingSystem {
  /// Android
  @literal
  const OperatingSystem$Android();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      android();

  @override
  String get name => 'Android';

  @override
  bool get android => true;

  @override
  bool get fuchsia => false;

  @override
  bool get iOS => false;

  @override
  bool get linux => false;

  @override
  bool get macOS => false;

  @override
  bool get windows => false;

  @override
  bool get unknown => false;

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$Android;
}

/// Fuchsia
final class OperatingSystem$Fuchsia extends OperatingSystem {
  /// Fuchsia
  @literal
  const OperatingSystem$Fuchsia();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      fuchsia();

  @override
  String get name => 'Fuchsia';

  @override
  bool get android => false;

  @override
  bool get fuchsia => true;

  @override
  bool get iOS => false;

  @override
  bool get linux => false;

  @override
  bool get macOS => false;

  @override
  bool get windows => false;

  @override
  bool get unknown => false;

  @override
  int get hashCode => 1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$Fuchsia;
}

/// iOS
final class OperatingSystem$iOS extends OperatingSystem {
  /// iOS
  @literal
  const OperatingSystem$iOS();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      iOS();

  @override
  String get name => 'iOS';

  @override
  bool get android => false;

  @override
  bool get fuchsia => false;

  @override
  bool get iOS => true;

  @override
  bool get linux => false;

  @override
  bool get macOS => false;

  @override
  bool get windows => false;

  @override
  bool get unknown => false;

  @override
  int get hashCode => 2;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$iOS;
}

/// Linux
final class OperatingSystem$Linux extends OperatingSystem {
  /// Linux
  @literal
  const OperatingSystem$Linux();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      linux();

  @override
  String get name => 'Linux';

  @override
  bool get android => false;

  @override
  bool get fuchsia => false;

  @override
  bool get iOS => false;

  @override
  bool get linux => true;

  @override
  bool get macOS => false;

  @override
  bool get windows => false;

  @override
  bool get unknown => false;

  @override
  int get hashCode => 3;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$Linux;
}

/// macOS
final class OperatingSystem$MacOS extends OperatingSystem {
  /// macOS
  @literal
  const OperatingSystem$MacOS();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      macOS();

  @override
  String get name => 'macOS';

  @override
  bool get android => false;

  @override
  bool get fuchsia => false;

  @override
  bool get iOS => false;

  @override
  bool get linux => false;

  @override
  bool get macOS => true;

  @override
  bool get windows => false;

  @override
  bool get unknown => false;

  @override
  int get hashCode => 4;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$MacOS;
}

/// Windows
final class OperatingSystem$Windows extends OperatingSystem {
  /// Windows
  @literal
  const OperatingSystem$Windows();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      windows();

  @override
  String get name => 'Windows';

  @override
  bool get android => false;

  @override
  bool get fuchsia => false;

  @override
  bool get iOS => false;

  @override
  bool get linux => false;

  @override
  bool get macOS => false;

  @override
  bool get windows => true;

  @override
  bool get unknown => false;

  @override
  int get hashCode => 5;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$Windows;
}

/// Unknown
final class OperatingSystem$Unknown extends OperatingSystem {
  /// Unknown
  @literal
  const OperatingSystem$Unknown();

  @override
  OperatingSystemResult when<OperatingSystemResult extends Object?>({
    required OperatingSystemResult Function() android,
    required OperatingSystemResult Function() fuchsia,
    required OperatingSystemResult Function() iOS,
    required OperatingSystemResult Function() linux,
    required OperatingSystemResult Function() macOS,
    required OperatingSystemResult Function() windows,
    required OperatingSystemResult Function() unknown,
  }) =>
      unknown();

  @override
  String get name => 'Unknown';

  @override
  bool get android => false;

  @override
  bool get fuchsia => false;

  @override
  bool get iOS => false;

  @override
  bool get linux => false;

  @override
  bool get macOS => false;

  @override
  bool get windows => false;

  @override
  bool get unknown => true;

  @override
  int get hashCode => 6;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is OperatingSystem$Unknown;
}

import 'base_host_platform.dart';
import 'enums.dart';

/// Mixin with methods that extend the functionality of the platform
mixin PlatformMethods on ExtendedHostPlatform {
  /// Run functions that satisfy the current state of the platform.
  /// You can use nested methods to compose more complex queries.
  /// Can return null, if [orElse] not set and any callback was not called.
  ///
  /// ### Operating System
  /// [fuchsia] - whether the operating system is a version of Fuchsia
  /// [windows] - whether the operating system is a version of Windows
  /// [android] - whether the operating system is a version of Android
  /// [iOS] - whether the operating system is a version of iOS
  /// [macOS] - whether the operating system is a version of MacOS
  /// [linux] - whether the operating system is a version of Linux
  /// [unknown] - operating system unknown
  ///
  /// ### Design
  /// [material] - is material (Android, Fuchsia)
  /// [cupertino] - is cupertino (macOS, iOS)
  ///
  /// ### Mobile or desktop
  /// [mobile] - is mobile device (Android, iOS)
  /// [desktop] - is desktop device (Windows, MacOS, Fuchsia)
  ///
  /// ### IO or Web
  /// [web] - is web-based applications
  /// [io] - is I/O supporting for non-web applications
  ///
  /// ### Build mode
  /// [release] - release build mode
  /// [profile] - profile build mode
  /// [debug] - debug build mode
  ///
  /// [orElse] - any callback was not called
  ///
  /// ### Sequence of checks
  /// 1. Operating System
  /// 2. Design
  /// 3. Mobile/Desktop
  /// 4. IO/Web
  /// 5. Build mode
  /// 6. Call [orElse] if any callback was not called
  ///
  /// Example:
  /// ```dart
  ///  final result = platform.when(
  ///    io: () => platform.when(
  ///      fuchsia:   () => ...,
  ///      windows:   () => ...,
  ///      android:   () => ...,
  ///      iOS:       () => ...,
  ///      macOS:     () => ...,
  ///      linux:     () => ...,
  ///      unknown:   () => ...,
  ///      orElse:    () => ...,
  ///    ),
  ///    web: () => platform.when(
  ///      material:  () => ...,
  ///      cupertino: () => ...,
  ///      orElse:    () => ...,
  ///    ),
  ///    orElse: () => ...,
  ///  );
  /// ```
  ///
  PlatformResult? when<PlatformResult>({
    PlatformResult Function()? fuchsia,
    PlatformResult Function()? windows,
    PlatformResult Function()? android,
    PlatformResult Function()? iOS,
    PlatformResult Function()? macOS,
    PlatformResult Function()? linux,
    PlatformResult Function()? unknown,
    PlatformResult Function()? material,
    PlatformResult Function()? cupertino,
    PlatformResult Function()? mobile,
    PlatformResult Function()? desktop,
    PlatformResult Function()? io,
    PlatformResult Function()? web,
    PlatformResult Function()? release,
    PlatformResult Function()? profile,
    PlatformResult Function()? debug,
    PlatformResult Function()? orElse,
  }) {
    {
      // Operating System
      if (fuchsia != null && isFuchsia) {
        return fuchsia();
      } else if (windows != null && isWindows) {
        return windows();
      } else if (android != null && isAndroid) {
        return android();
      } else if (iOS != null && isIOS) {
        return iOS();
      } else if (macOS != null && isMacOS) {
        return macOS();
      } else if (linux != null && isLinux) {
        return linux();
      } else if (unknown != null && !isOperatingSystemKnown) {
        return unknown();
      }
    }

    {
      // Design
      if (material != null && isMaterial) {
        return material();
      } else if (cupertino != null && isCupertino) {
        return cupertino();
      }
    }

    {
      // Mobile/Desktop
      if (mobile != null && isMobile) {
        return mobile();
      } else if (desktop != null && isDesktop) {
        return desktop();
      }
    }

    {
      // IO/Web
      if (io != null && isIO) {
        return io();
      } else if (web != null && isWeb) {
        return web();
      }
    }

    {
      // Build mode
      if (debug != null && buildMode == BuildMode.debug) {
        return debug();
      } else if (profile != null && buildMode == BuildMode.profile) {
        return profile();
      } else if (release != null && buildMode == BuildMode.release) {
        return release();
      }
    }

    // Any callback was not called
    return orElse != null ? orElse() : null;
  }
}

// ignore_for_file: unnecessary_this

import 'base_host_platform.dart';

/// Mixin with methods that extend the functionality of the platform
base mixin PlatformMethods on ExtendedHostPlatform {
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
  /// [js] - is web-based applications
  /// [vm] - is I/O supporting for non-web applications
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
    PlatformResult Function()? vm,
    PlatformResult Function()? js,
    PlatformResult Function()? release,
    PlatformResult Function()? profile,
    PlatformResult Function()? debug,
    PlatformResult Function()? orElse,
  }) {
    {
      // Operating System
      if (fuchsia != null && this.fuchsia) {
        return fuchsia();
      } else if (windows != null && this.windows) {
        return windows();
      } else if (android != null && this.android) {
        return android();
      } else if (iOS != null && this.iOS) {
        return iOS();
      } else if (macOS != null && this.macOS) {
        return macOS();
      } else if (linux != null && this.linux) {
        return linux();
      } else if (unknown != null && this.unknown) {
        return unknown();
      }
    }

    {
      // Design
      if (material != null && this.material) {
        return material();
      } else if (cupertino != null && this.cupertino) {
        return cupertino();
      }
    }

    {
      // Mobile/Desktop
      if (mobile != null && this.mobile) {
        return mobile();
      } else if (desktop != null && this.desktop) {
        return desktop();
      }
    }

    {
      // IO/Web
      if (vm != null && this.vm) {
        return vm();
      } else if (js != null && this.js) {
        return js();
      }
    }

    {
      // Build mode
      if (debug != null && this.buildMode.debug) {
        return debug();
      } else if (profile != null && this.buildMode.profile) {
        return profile();
      } else if (release != null && this.buildMode.release) {
        return release();
      }
    }

    // Any callback was not called
    return orElse != null ? orElse() : null;
  }
}

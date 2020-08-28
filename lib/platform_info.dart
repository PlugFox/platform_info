library platform_info;

import 'src/platform.dart' show Platform;

export 'src/enums.dart';
export 'src/platform.dart';

/// [Platform] info
/// Works on the web, mobile phones, desktops and console.
/// Provides platform information such as:
///   + Build mode
///      * release (release build mode)
///      * profile (profile build mode)
///      * debug (debug build mode)
///
///   + Host platform type
///      * io (desktops, mobile, console)
///      * web (browser)
///
///   + Operation system
///      * Fuchsia
///      * Linux
///      * MacOS
///      * Windows
///      * iOS
///      * Android
///      * Unknown
///
///   + Version
///
///   + Locale string
///
///   + The number of individual execution units of the machine.
///
///   + Operating system is known type
///
///   + Is mobile device (Android, iOS)
///
///   + Is desktop device (Windows, MacOS, Fuchsia)
///
///   + Is material (Android, Fuchsia)
///
///   + Is cupertino (MacOS, iOS)
///
///
Platform get platform => Platform.instance;

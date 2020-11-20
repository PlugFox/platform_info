# platform_info  
  
[![](https://github.com/PlugFox/platform_info/raw/master/.img/logo.png)](https://github.com/PlugFox/platform_info)  
  
[![Actions Status](https://github.com/PlugFox/platform_info/workflows/platform_info/badge.svg)](https://github.com/PlugFox/platform_info/actions)
[![Coverage](https://codecov.io/gh/PlugFox/platform_info/branch/master/graph/badge.svg)](https://codecov.io/gh/PlugFox/platform_info)
[![Pub](https://img.shields.io/pub/v/platform_info.svg)](https://pub.dev/packages/platform_info)
[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-brightgreen.svg)](https://en.wikipedia.org/wiki/WTFPL)
[![effective_dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
  
  
## About  
  
Cross-platform io/html package.  
Works on the web, mobile phones, desktops and console.  
Fully caches itself on first initialization.  
  
Easy to use, just add to `pubspec.yaml` as dependency and then import:  
`import 'package:platform_info/platform_info.dart';`  
  
Platform is a singleton, and the default way to access an instance of Platform is to call static getters:  
`Platform.instance` or `Platform.I` or `platform`  
  
  
## Platform Information  
  
Provides platform information such as:  
  + Build mode  
     * release  
     * profile  
     * debug  
    
  + Host platform type  
     * io (vm, desktops, mobile, console)  
     * web (html, js, browser)  
    
  + Operating system  
     * Fuchsia  
     * Linux  
     * MacOS  
     * Windows  
     * iOS  
     * Android  
     * Unknown  
    
  + Version (`<unknown>` if not available)  
    
  + Locale string (`en` if not available)  
    
  + The number of individual execution units of the machine (`0` if not available)  
    
  + Operating system is known type  
  
  + Is a web-based applications  
  
  + Is a I/O supporting for non-web applications  
  
  + Is a mobile device (Android, iOS)  
    
  + Is a desktop device (Windows, macOS, Fuchsia)  
    
  + Is material design device (Android, Fuchsia)  
    
  + Is cupertino design device (macOS, iOS)  
    
  + isLinux  
    
  + isMacOS  
    
  + isWindows  
    
  + isAndroid  
    
  + isIOS  
    
  + isFuchsia  
  
  + `when` method allowing to compose a complex condition  
  
  
## platform.when  
    
Run functions that satisfy the current state of the platform.  
You can use nested methods to compose more complex queries.  
  
##### Operating System  
[fuchsia] - whether the operating system is a version of Fuchsia  
[windows] - whether the operating system is a version of Windows  
[android] - whether the operating system is a version of Android  
[iOS] - whether the operating system is a version of iOS  
[macOS] - whether the operating system is a version of MacOS  
[linux] - whether the operating system is a version of Linux  
[unknown] - operating system unknown  
  
##### Design  
[material] - is material (Android, Fuchsia)  
[cupertino] - is cupertino (macOS, iOS)  
  
##### Mobile or desktop  
[mobile] - is mobile device (Android, iOS)  
[desktop] - is desktop device (Windows, MacOS, Fuchsia)  
  
##### IO or Web  
[web] - is web-based applications  
[io] - is I/O supporting for non-web applications  
  
##### Build mode  
[release] - release build mode  
[profile] - profile build mode  
[debug] - debug build mode  
[orElse] - any callback was not called  
  
##### Sequence of checks
1. Operating System
2. Design
3. Mobile/Desktop
4. IO/Web
5. Build mode
6. Call [orElse] if any callback was not called  
  
  
## For example  
  
```dart
import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.version);
  print(Platform.I.operatingSystem);
  print(platform.numberOfProcessors.gcd(1));

  final string = platform.when(
    io: () => platform.when(
      fuchsia:   () => 'io fuchsia',
      windows:   () => 'io windows',
      android:   () => 'io android',
      iOS:       () => 'io iOS',
      macOS:     () => 'io macOS',
      linux:     () => 'io linux',
      unknown:   () => 'io unknown',
    ),
    web: () => platform.when(
      material:  () => 'web Android or Fuchsia',
      cupertino: () => 'web macOS or iOS',
      orElse:    () => 'web Windows or Linux or unknown',
    ),
  );
  print(string);
}
```
  
  
## Coverage  
  
[![](https://codecov.io/gh/PlugFox/platform_info/branch/dev/graphs/sunburst.svg)](https://codecov.io/gh/PlugFox/platform_info/branch/master)  
  
  
## Changelog  
  
Refer to the [Changelog](https://github.com/plugfox/platform_info/blob/master/CHANGELOG.md) to get all release notes.  
  
  
## Maintainers  
  
[Plague Fox](https://plugfox.dev)  
  
  
## License  
  
[WTFPL](https://github.com/plugfox/platform_info/blob/master/LICENSE)  
  
  
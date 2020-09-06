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
  
  
## For example  
  
```dart
import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.version);
  print(Platform.I.operatingSystem);
  print(platform.numberOfProcessors.gcd(1));
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
  
  
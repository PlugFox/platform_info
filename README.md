# platform_info  

![](https://github.com/PlugFox/platform_info/raw/master/.img/logo.png)  
  
[![chatroom icon](https://patrolavia.github.io/telegram-badge/chat.png)](https://t.me/PlugFox)
[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/plugfox/platform_info/blob/master/LICENSE)
[![Pub](https://img.shields.io/pub/v/platform_info.svg)](https://pub.dartlang.org/packages/platform_info)
  
  
## About  
  
Cross-platform io/html package.  
Works on the web, mobile phones, desktops and console.  
Fully caches itself on first initialization.  
Can serialize to JSON map.  
Provides platform information such as:  
  + Build mode  
     * release  
     * profile  
     * debug  
  
  + Host platform type  
     * io  
     * web  
  
  + Operating system  
     * Fuchsia  
     * Linux  
     * MacOS  
     * Windows  
     * iOS  
     * Android  
     * Unknown  
  
  + Version  
  
  + Locale string  
  
  + The number of individual execution units of the machine.  
  
  + Operating system is known type  
  
  + Is mobile device (Android, iOS)  

  + Is desktop device (Windows, MacOS, Fuchsia)  
  
  + Is material (Android, Fuchsia)  
  
  + Is cupertino (MacOS, iOS)  
  

### For example:  
  
```dart
  // Just create Platform() singleton object
  final Platform _platform = Platform();
  final String version = _platform.version;
  print(version);
```
  
  
## Changelog  
  
Refer to the [Changelog](https://github.com/plugfox/platform_info/blob/master/CHANGELOG.md) to get all release notes.  
  
  
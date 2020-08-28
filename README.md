# platform_info  

![](https://github.com/PlugFox/platform_info/raw/master/.img/logo.png)  
  
[![chatroom icon](https://patrolavia.github.io/telegram-badge/chat.png)](https://t.me/PlugFox)
[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/plugfox/platform_info/blob/master/LICENSE)
[![Pub](https://img.shields.io/pub/v/platform_info.svg)](https://pub.dartlang.org/packages/platform_info)
  
  
## About  
  
Cross-platform io/html package.  
Works on the web, mobile phones, desktops and console.  
Fully caches itself on first initialization.  

Easy to use, just import: 

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
    
  + Version  
    
  + Locale string  
    
  + The number of individual execution units of the machine  
    
  + Operating system is known type  
    
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
  
  
### For example:  
  
```dart
import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.numberOfProcessors);
  print(Platform.I.operatingSystem);
  print(Platform.I.version);
}
```
  
  
## Changelog  
  
Refer to the [Changelog](https://github.com/plugfox/platform_info/blob/master/CHANGELOG.md) to get all release notes.  
  
  
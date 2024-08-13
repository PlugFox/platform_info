// ignore_for_file: avoid_print

import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.version);
  print(Platform.I.operatingSystem);
  print(platform.numberOfProcessors);

  final design = platform.when<String?>(
    vm: () => platform.when<String>(
      material: () => 'Android or Fuchsia',
      cupertino: () => 'macOS or iOS',
      orElse: () => 'Windows or Linux',
    ),
    js: () => 'Web',
  );
  print(design);

  final operatingSystem = switch (platform.operatingSystem) {
    OperatingSystem$Android _ => 'Android',
    OperatingSystem$Fuchsia _ => 'Fuchsia',
    OperatingSystem$iOS _ => 'iOS',
    OperatingSystem$Linux _ => 'Linux',
    OperatingSystem$MacOS _ => 'macOS',
    OperatingSystem$Windows _ => 'Windows',
    OperatingSystem$Unknown _ => 'Unknown',
  };
  print(operatingSystem);

  final buildMode = switch (platform.buildMode) {
    BuildMode$Debug _ => 'Debug',
    BuildMode$Profile _ => 'Profile',
    BuildMode$Release _ => 'Release',
  };
  print(buildMode);
}

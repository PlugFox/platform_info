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
    const OperatingSystem.android() => 'Android',
    const OperatingSystem.fuchsia() => 'Fuchsia',
    const OperatingSystem.iOS() => 'iOS',
    const OperatingSystem.linux() => 'Linux',
    const OperatingSystem.macOS() => 'macOS',
    const OperatingSystem.windows() => 'Windows',
    const OperatingSystem.unknown() || _ => 'Unknown',
  };
  print(operatingSystem);

  final buildMode = switch (platform.buildMode) {
    BuildMode$Debug _ => 'Debug',
    BuildMode$Profile _ => 'Profile',
    BuildMode$Release _ => 'Release',
  };
  print(buildMode);
}

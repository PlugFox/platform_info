// ignore_for_file: avoid_print

import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.version);
  print(Platform.I.operatingSystem);
  print(platform.numberOfProcessors);

  final design = platform.when<String?>(
    io: () => platform.when<String>(
      material: () => 'Android or Fuchsia',
      cupertino: () => 'macOS or iOS',
      orElse: () => 'Windows or Linux',
    ),
    web: () => 'Web',
  );
  print(design);

  final operatingSystem = switch (platform.operatingSystem) {
    OperatingSystem.android => 'Android',
    OperatingSystem.fuchsia => 'Fuchsia',
    OperatingSystem.iOS => 'iOS',
    OperatingSystem.linux => 'Linux',
    OperatingSystem.macOS => 'macOS',
    OperatingSystem.windows => 'Windows',
    OperatingSystem.unknown => 'Unknown',
  };
  print(operatingSystem);

  final buildMode = switch (platform.buildMode) {
    BuildMode.debug => 'Debug',
    BuildMode.profile => 'Profile',
    BuildMode.release => 'Release',
  };
  print(buildMode);
}

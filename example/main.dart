// ignore_for_file: avoid_print

import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.version);
  print(Platform.I.operatingSystem);
  print(platform.numberOfProcessors.gcd(1));

  final string = platform.when(
        io: () => platform.when(
          fuchsia: () => 'io fuchsia',
          windows: () => 'io windows',
          android: () => 'io android',
          iOS: () => 'io iOS',
          macOS: () => 'io macOS',
          linux: () => 'io linux',
          unknown: () => 'io unknown',
        ),
        web: () => platform.when(
          material: () => 'web Android or Fuchsia',
          cupertino: () => 'web macOS or iOS',
          orElse: () => 'web Windows or Linux or unknown',
        ),
      ) ??
      '<unknown platform>';
  print(string);
}

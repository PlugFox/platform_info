// ignore_for_file: avoid_print

import 'package:platform_info/platform_info.dart';

void main(List<String> args) {
  // Use [Platform.instance] or [Platform.I] or [platform] getter
  print(Platform.instance.numberOfProcessors);
  print(Platform.I.operatingSystem);
  print(Platform.I.version);
}

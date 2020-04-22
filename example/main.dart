// ignore_for_file: avoid_print

import 'package:platform_info/platform_info.dart';

void main() {
  // Just create Platform() singleton object
  final Platform _platform = Platform();
  final String version = _platform.version;
  print(version);
}

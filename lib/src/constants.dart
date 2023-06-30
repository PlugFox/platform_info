import 'package:meta/meta.dart';

import 'base_host_platform.dart' show HostPlatform;
import 'default_host_platform.dart';
import 'enums.dart';

/// Set of all mobile phone operating systems
@internal
const Set<OperatingSystem> kListOSForMobile = <OperatingSystem>{
  OperatingSystem.android,
  OperatingSystem.iOS,
};

/// Set of all operating systems with material design
@internal
const Set<OperatingSystem> kListOSWithMaterialDesign = <OperatingSystem>{
  OperatingSystem.android,
  OperatingSystem.fuchsia,
};

/// Set of all operating systems with cupertino design
@internal
const Set<OperatingSystem> kListOSWithCupertinoDesign = <OperatingSystem>{
  OperatingSystem.macOS,
  OperatingSystem.iOS,
};

/// Set of all desktop operating systems
@internal
const Set<OperatingSystem> kListOSForDesktop = <OperatingSystem>{
  OperatingSystem.windows,
  OperatingSystem.macOS,
  OperatingSystem.fuchsia,
  OperatingSystem.linux,
};

/// Unknown host platform with default values
@internal
const HostPlatform kDefaultHostPlatform = DefaultHostPlatform();

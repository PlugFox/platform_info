import 'package:meta/meta.dart';

import 'base_host_platform.dart' show HostPlatform;
import 'default_host_platform.dart';
import 'enums.dart';

/// Set of all mobile phone operating systems
@internal
final Set<OperatingSystem> kListOSForMobile = <OperatingSystem>{
  const OperatingSystem.android(),
  const OperatingSystem.iOS(),
};

/// Set of all operating systems with material design
@internal
final Set<OperatingSystem> kListOSWithMaterialDesign = <OperatingSystem>{
  const OperatingSystem.android(),
  const OperatingSystem.fuchsia(),
};

/// Set of all operating systems with cupertino design
@internal
final Set<OperatingSystem> kListOSWithCupertinoDesign = <OperatingSystem>{
  const OperatingSystem.macOS(),
  const OperatingSystem.iOS(),
};

/// Set of all desktop operating systems
@internal
final Set<OperatingSystem> kListOSForDesktop = <OperatingSystem>{
  const OperatingSystem.windows(),
  const OperatingSystem.macOS(),
  const OperatingSystem.fuchsia(),
  const OperatingSystem.linux(),
};

/// Unknown host platform with default values
@internal
const HostPlatform kDefaultHostPlatform = DefaultHostPlatform();

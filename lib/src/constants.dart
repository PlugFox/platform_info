import 'base_host_platform.dart' show HostPlatform;
import 'default_host_platform.dart';
import 'enums.dart';

/// List of all mobile phone operating systems
const List<OperatingSystem> kListOSForMobile = <OperatingSystem>[
  OperatingSystem.android,
  OperatingSystem.iOS,
];

/// List of all operating systems with material design
const List<OperatingSystem> kListOSWithMaterialDesign = <OperatingSystem>[
  OperatingSystem.android,
  OperatingSystem.fuchsia,
];

/// List of all operating systems with cupertino design
const List<OperatingSystem> kListOSWithCupertinoDesign = <OperatingSystem>[
  OperatingSystem.macOS,
  OperatingSystem.iOS,
];

/// List of all desktop operating systems
const List<OperatingSystem> kListOSForDesktop = <OperatingSystem>[
  OperatingSystem.windows,
  OperatingSystem.macOS,
  OperatingSystem.fuchsia,
  OperatingSystem.linux,
];

/// Unknown host platform with default values
const HostPlatform kDefaultHostPlatform = DefaultHostPlatform();

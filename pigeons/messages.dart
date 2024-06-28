import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/messages.g.dart',
  dartOptions: DartOptions(),
  objcHeaderOut: 'ios/Classes/messages.g.h',
  objcSourceOut: 'ios/Classes/messages.g.m',
  objcOptions: ObjcOptions(prefix: 'AC'),
))

class MemoryUsage {
  double? dirtyMemoryUsage;
  double? ownedSharedMemoryUsage;
}

class StartupTime {
  int? startupTime;
}

@HostApi()
abstract class PollIosStats {
  MemoryUsage pollMemoryUsage();
  StartupTime pollStartupTime();
}

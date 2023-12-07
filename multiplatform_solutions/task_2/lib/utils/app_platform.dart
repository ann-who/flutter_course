import 'dart:io';

import 'package:flutter/foundation.dart';

enum CustomPlatform {
  linux,
  macos,
  windows,
  android,
  ios,
  fuchsia,
  web,
  unknown,
}

abstract class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'android': CustomPlatform.android,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia,
  };
  static String _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web.name;
    }
    return _platformMap[Platform.operatingSystem]?.name ??
        CustomPlatform.unknown.name;
  }

  static String get platform => _getPlatform();

  static bool get isWeb => _getPlatform() == CustomPlatform.web.name;
}

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:root_checker_plus/root_checker_plus.dart';

class RootDetectionService {
  Future<Map<String, bool>> checkRootStatus() async {
    bool rootedCheck = false;
    bool devMode = false;
    bool jailbreak = false;

    try {
      if (Platform.isAndroid) {
        rootedCheck = (await RootCheckerPlus.isRootChecker()) ?? false;
        devMode = (await RootCheckerPlus.isDeveloperMode()) ?? false;
      } else if (Platform.isIOS) {
        jailbreak = (await RootCheckerPlus.isJailbreak()) ?? false;
      }
    } on PlatformException {
      // Handle the exception or set default values
      rootedCheck = false;
      devMode = false;
      jailbreak = false;
    }

    return {
      'rootedCheck': rootedCheck,
      'devMode': devMode,
      'jailbreak': jailbreak,
    };
  }
}

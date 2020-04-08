import 'package:flutter/foundation.dart';
class BuildCheck {

  static String  checkIf() {
    if (kReleaseMode) {
      print("RELEASE");
      return "";

    } else {
      print("DEBUG");
      return "http://localhost:5000";
    }
  }


}
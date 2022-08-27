import 'package:flutter/material.dart';

class GlobalValues {
  static bool loginStatus = false;

  static void setLoginStatus(bool val) {
    loginStatus = val;
  }

  static bool getLoginStatus() {
    return loginStatus == null ? false : loginStatus;
  }
}

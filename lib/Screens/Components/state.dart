import 'package:flutter/cupertino.dart';

class GlobalValues {
  static var user = GlobalKey();

  static void setGlobalkey(GlobalKey val) {
    user = val;
  }

  static GlobalKey getGlobalkey() {
    return user;
  }
}

import 'package:flutter/cupertino.dart';

/// Global variables
/// * [GlobalKey<NavigatorState>]
class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
  static const ISLOGIN = "islogin";
  static const USERID = "userid";
}

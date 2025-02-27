// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';


Future dyantraceActionActivity(String actionName, bool isEntering) async {
  // Add your function code here!
  if(isEntering){
    ActionManager.instance.addAction(actionName);
  }else{
    ActionManager.instance.removeAction(actionName);
  }
}

class ActionManager {
  Map<String, DynatraceAction> liveActions = {};

  ActionManager._();

  static ActionManager instance = ActionManager._();

  void addAction(String actionName) {
    liveActions['action'] =Dynatrace().enterAction(actionName);
  }

  void removeAction(String actionName) {
    final action=liveActions.remove(actionName);
    action?.leaveAction();
  }
}
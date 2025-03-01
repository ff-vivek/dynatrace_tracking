// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';

Future dyantraceEnterAction(String actionName) async {
  // Add your function code here!
  Dynatrace().enterAction(actionName);
}

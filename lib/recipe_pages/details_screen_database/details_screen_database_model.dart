import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/create_note_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreenDatabaseModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for shortBio widget.
  TextEditingController? shortBioController1;
  String? Function(BuildContext, String?)? shortBioController1Validator;
  // State field(s) for shortBio widget.
  TextEditingController? shortBioController2;
  String? Function(BuildContext, String?)? shortBioController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    shortBioController1?.dispose();
    shortBioController2?.dispose();
  }

  /// Additional helper methods are added here.

}

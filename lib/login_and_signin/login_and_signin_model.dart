import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginAndSigninModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtCorreoInicio widget.
  TextEditingController? txtCorreoInicioController;
  String? Function(BuildContext, String?)? txtCorreoInicioControllerValidator;
  // State field(s) for txtContrasenaInicio widget.
  TextEditingController? txtContrasenaInicioController;
  late bool txtContrasenaInicioVisibility;
  String? Function(BuildContext, String?)?
      txtContrasenaInicioControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtContrasenaInicioVisibility = false;
  }

  void dispose() {
    txtCorreoInicioController?.dispose();
    txtContrasenaInicioController?.dispose();
  }

  /// Additional helper methods are added here.

}

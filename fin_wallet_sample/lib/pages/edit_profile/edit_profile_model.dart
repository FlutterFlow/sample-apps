import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode;
  TextEditingController? yourEmailController;
  String? Function(BuildContext, String?)? yourEmailControllerValidator;
  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeController;
  String? Function(BuildContext, String?)? yourAgeControllerValidator;
  // State field(s) for yourTitle widget.
  FocusNode? yourTitleFocusNode;
  TextEditingController? yourTitleController;
  String? Function(BuildContext, String?)? yourTitleControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    yourEmailFocusNode?.dispose();
    yourEmailController?.dispose();

    yourAgeFocusNode?.dispose();
    yourAgeController?.dispose();

    yourTitleFocusNode?.dispose();
    yourTitleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

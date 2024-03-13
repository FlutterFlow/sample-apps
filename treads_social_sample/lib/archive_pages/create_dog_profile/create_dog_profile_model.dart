import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'create_dog_profile_widget.dart' show CreateDogProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateDogProfileModel extends FlutterFlowModel<CreateDogProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for dogName widget.
  FocusNode? dogNameFocusNode;
  TextEditingController? dogNameController;
  String? Function(BuildContext, String?)? dogNameControllerValidator;
  // State field(s) for dogBreed widget.
  FocusNode? dogBreedFocusNode;
  TextEditingController? dogBreedController;
  String? Function(BuildContext, String?)? dogBreedControllerValidator;
  // State field(s) for dogAge widget.
  FocusNode? dogAgeFocusNode;
  TextEditingController? dogAgeController;
  String? Function(BuildContext, String?)? dogAgeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dogNameFocusNode?.dispose();
    dogNameController?.dispose();

    dogBreedFocusNode?.dispose();
    dogBreedController?.dispose();

    dogAgeFocusNode?.dispose();
    dogAgeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

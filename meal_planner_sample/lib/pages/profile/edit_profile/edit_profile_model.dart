import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/components/title_with_subtitle/title_with_subtitle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  bool unsavedChanges = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  // Model for titleWithSubtitle component.
  late TitleWithSubtitleModel titleWithSubtitleModel1;
  // Model for titleWithSubtitle component.
  late TitleWithSubtitleModel titleWithSubtitleModel2;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    titleWithSubtitleModel1 =
        createModel(context, () => TitleWithSubtitleModel());
    titleWithSubtitleModel2 =
        createModel(context, () => TitleWithSubtitleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    titleWithSubtitleModel1.dispose();
    titleWithSubtitleModel2.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

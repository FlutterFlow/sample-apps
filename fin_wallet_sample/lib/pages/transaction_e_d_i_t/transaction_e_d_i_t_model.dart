import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transaction_e_d_i_t_widget.dart' show TransactionEDITWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionEDITModel extends FlutterFlowModel<TransactionEDITWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pg18rcyu' /* Please enter an amount */,
      );
    }

    return null;
  }

  // State field(s) for SpentAt widget.
  FocusNode? spentAtFocusNode;
  TextEditingController? spentAtController;
  String? Function(BuildContext, String?)? spentAtControllerValidator;
  // State field(s) for budget widget.
  String? budgetValue;
  FormFieldController<String>? budgetValueController;
  // State field(s) for reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonController;
  String? Function(BuildContext, String?)? reasonControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    spentAtFocusNode?.dispose();
    spentAtController?.dispose();

    reasonFocusNode?.dispose();
    reasonController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

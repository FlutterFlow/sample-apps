import '/components/accordion_section/accordion_section_widget.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'support_center_widget.dart' show SupportCenterWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupportCenterModel extends FlutterFlowModel<SupportCenterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // Model for accordionSection component.
  late AccordionSectionModel accordionSectionModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    accordionSectionModel = createModel(context, () => AccordionSectionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
    accordionSectionModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

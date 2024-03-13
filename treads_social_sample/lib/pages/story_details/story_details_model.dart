import '/components/web_components/stories/stories_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'story_details_widget.dart' show StoryDetailsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoryDetailsModel extends FlutterFlowModel<StoryDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for stories component.
  late StoriesModel storiesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    storiesModel = createModel(context, () => StoriesModel());
  }

  @override
  void dispose() {
    storiesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

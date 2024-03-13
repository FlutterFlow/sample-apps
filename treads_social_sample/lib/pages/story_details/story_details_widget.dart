import '/components/web_components/stories/stories_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'story_details_model.dart';
export 'story_details_model.dart';

class StoryDetailsWidget extends StatefulWidget {
  const StoryDetailsWidget({
    super.key,
    this.initialStoryIndex,
  });

  final int? initialStoryIndex;

  @override
  State<StoryDetailsWidget> createState() => _StoryDetailsWidgetState();
}

class _StoryDetailsWidgetState extends State<StoryDetailsWidget> {
  late StoryDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1A1F24),
      body: SafeArea(
        top: true,
        child: wrapWithModel(
          model: _model.storiesModel,
          updateCallback: () => setState(() {}),
          child: StoriesWidget(
            initialIndex: widget.initialStoryIndex,
          ),
        ),
      ),
    );
  }
}

import '/backend/backend.dart';
import '/components/web_components/post_details_base/post_details_base_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_details_page_model.dart';
export 'post_details_page_model.dart';

class PostDetailsPageWidget extends StatefulWidget {
  const PostDetailsPageWidget({
    super.key,
    this.postReference,
    this.userRecord,
  });

  final UserPostsRecord? postReference;
  final UsersRecord? userRecord;

  @override
  State<PostDetailsPageWidget> createState() => _PostDetailsPageWidgetState();
}

class _PostDetailsPageWidgetState extends State<PostDetailsPageWidget> {
  late PostDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsPageModel());

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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: SideNavWidget(
              selectedNav: 1,
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: wrapWithModel(
                model: _model.postDetailsBaseModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: PostDetailsBaseWidget(
                  postRef: widget.postReference?.reference,
                  userRef: widget.userRecord!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

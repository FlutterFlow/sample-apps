import '/backend/backend.dart';
import '/components/web_components/post_details_base/post_details_base_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_modal_view_model.dart';
export 'post_modal_view_model.dart';

class PostModalViewWidget extends StatefulWidget {
  const PostModalViewWidget({
    super.key,
    required this.postRef,
    required this.userRef,
  });

  final UserPostsRecord? postRef;
  final UsersRecord? userRef;

  @override
  State<PostModalViewWidget> createState() => _PostModalViewWidgetState();
}

class _PostModalViewWidgetState extends State<PostModalViewWidget>
    with TickerProviderStateMixin {
  late PostModalViewModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModalViewModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 12.0, 32.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.8,
              constraints: BoxConstraints(
                maxWidth: 530.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x1E000000),
                    offset: Offset(0.0, 5.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).dark800Persist,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: wrapWithModel(
                    model: _model.postDetailsBaseModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: PostDetailsBaseWidget(
                      postRef: widget.postRef?.reference,
                      userRef: widget.userRef!,
                    ),
                  ),
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        ],
      ),
    );
  }
}

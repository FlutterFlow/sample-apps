import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_stories_model.dart';
export 'empty_list_stories_model.dart';

class EmptyListStoriesWidget extends StatefulWidget {
  const EmptyListStoriesWidget({super.key});

  @override
  State<EmptyListStoriesWidget> createState() => _EmptyListStoriesWidgetState();
}

class _EmptyListStoriesWidgetState extends State<EmptyListStoriesWidget> {
  late EmptyListStoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListStoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.account_circle_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 36.0,
            ),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.account_circle_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 36.0,
            ),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.account_circle_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 36.0,
            ),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.account_circle_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 36.0,
            ),
          ),
        ),
      ]
          .divide(SizedBox(width: 12.0))
          .addToStart(SizedBox(width: 16.0))
          .addToEnd(SizedBox(width: 16.0)),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_state_simple_model.dart';
export 'empty_state_simple_model.dart';

class EmptyStateSimpleWidget extends StatefulWidget {
  const EmptyStateSimpleWidget({
    super.key,
    this.icon,
    String? title,
    String? body,
  })  : this.title = title ?? 'No Comments',
        this.body = body ?? 'There are no comments associated with this post.';

  final Widget? icon;
  final String title;
  final String body;

  @override
  State<EmptyStateSimpleWidget> createState() => _EmptyStateSimpleWidgetState();
}

class _EmptyStateSimpleWidgetState extends State<EmptyStateSimpleWidget> {
  late EmptyStateSimpleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateSimpleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon!,
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: Text(
              widget.body,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

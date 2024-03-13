import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list1_model.dart';
export 'empty_list1_model.dart';

class EmptyList1Widget extends StatefulWidget {
  const EmptyList1Widget({super.key});

  @override
  State<EmptyList1Widget> createState() => _EmptyList1WidgetState();
}

class _EmptyList1WidgetState extends State<EmptyList1Widget> {
  late EmptyList1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyList1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.photo_library_outlined,
          color: FlutterFlowTheme.of(context).primary,
          size: 90.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Text(
            'No Posts',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
          child: Text(
            'It seems that there are no posts here. Check back later to see the latest stuff going on!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium,
          ),
        ),
      ],
    );
  }
}

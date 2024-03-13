import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_model.dart';
export 'user_list_model.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late UserListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: FutureBuilder<UsersRecord>(
        future: UsersRecord.getDocumentOnce(widget.userRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final containerUsersRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 300),
                          fadeOutDuration: Duration(milliseconds: 300),
                          imageUrl: valueOrDefault<String>(
                            containerUsersRecord.photoUrl,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/school-social-uni-demo-ttazup/assets/r5iuluq1cerl/favicon%401x.png',
                          ),
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              containerUsersRecord.displayName,
                              'Ghost User',
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                containerUsersRecord.email,
                                '--',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Figtree',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

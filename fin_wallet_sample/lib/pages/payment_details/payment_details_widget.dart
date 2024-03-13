import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_details_model.dart';
export 'payment_details_model.dart';

class PaymentDetailsWidget extends StatefulWidget {
  const PaymentDetailsWidget({
    super.key,
    this.transactionDetails,
    this.userSpent,
  });

  final DocumentReference? transactionDetails;
  final DocumentReference? userSpent;

  @override
  State<PaymentDetailsWidget> createState() => _PaymentDetailsWidgetState();
}

class _PaymentDetailsWidgetState extends State<PaymentDetailsWidget> {
  late PaymentDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransactionsRecord>(
      stream: TransactionsRecord.getDocument(widget.transactionDetails!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPumpingHeart(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final paymentDetailsTransactionsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).textColor,
                size: 32.0,
              ),
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'j0yzgf4n' /* Details */,
              ),
              style: FlutterFlowTheme.of(context).titleSmall,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 46.0,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: FlutterFlowTheme.of(context).textColor,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'transaction_EDIT',
                      queryParameters: {
                        'transactionDetails': serializeParam(
                          paymentDetailsTransactionsRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zv72ekdw' /* Amount */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 4.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                '\$${paymentDetailsTransactionsRecord.transactionAmount}',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 36.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '0rjyjwed' /* Vendor */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          paymentDetailsTransactionsRecord.transactionName,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'eeyn6dk2' /* When */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        dateTimeFormat(
                          'MMMEd',
                          paymentDetailsTransactionsRecord.transactionTime!,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          dateTimeFormat(
                            'jm',
                            paymentDetailsTransactionsRecord.transactionTime!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'lccxx6eu' /* Reason */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          paymentDetailsTransactionsRecord.transactionReason,
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'jzyax4hn' /* Spent by */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(widget.userSpent!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: SpinKitPumpingHeart(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }
                          final containerUsersRecord = snapshot.data!;
                          return Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: valueOrDefault<String>(
                                              containerUsersRecord.photoUrl,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-e-comm-3oxq8y/assets/hszmaloprc7a/Mia%20Deaven.jpg',
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                containerUsersRecord
                                                    .displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            containerUsersRecord.email,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'budget_d_e_l_e_t_e_model.dart';
export 'budget_d_e_l_e_t_e_model.dart';

class BudgetDELETEWidget extends StatefulWidget {
  const BudgetDELETEWidget({
    super.key,
    this.budgetList,
  });

  final DocumentReference? budgetList;

  @override
  State<BudgetDELETEWidget> createState() => _BudgetDELETEWidgetState();
}

class _BudgetDELETEWidgetState extends State<BudgetDELETEWidget> {
  late BudgetDELETEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BudgetDELETEModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BudgetsRecord>(
      stream: BudgetsRecord.getDocument(widget.budgetList!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).errorRed,
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
        final budgetDELETEBudgetsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).errorRed,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                buttonSize: 48.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 25.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Image.asset(
                            'assets/images/fin_budgetRemove@2x.png',
                            width: 200.0,
                            height: 180.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'pozov0xz' /* Delete Budget */,
                            ),
                            style: FlutterFlowTheme.of(context).displaySmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'aptjmof0' /* If you delete this budget, you... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<BudgetListRecord>>(
                          stream: queryBudgetListRecord(
                            queryBuilder: (budgetListRecord) =>
                                budgetListRecord.where(
                              'budgetUser',
                              isEqualTo: currentUserReference,
                            ),
                            singleRecord: true,
                          ),
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
                            List<BudgetListRecord> buttonBudgetListRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonBudgetListRecord =
                                buttonBudgetListRecordList.isNotEmpty
                                    ? buttonBudgetListRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                await budgetDELETEBudgetsRecord.reference
                                    .delete();

                                await buttonBudgetListRecord!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'budget': FieldValue.arrayRemove([
                                        budgetDELETEBudgetsRecord.budetName
                                      ]),
                                    },
                                  ),
                                });

                                context.goNamed(
                                  'MY_Budgets',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '9l7pbjcj' /* Delete Budget */,
                              ),
                              options: FFButtonOptions(
                                width: 300.0,
                                height: 70.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).errorRed,
                                textStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'u0kr38at' /* Tap above to remove this bude */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend',
                      color: Color(0x43000000),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}

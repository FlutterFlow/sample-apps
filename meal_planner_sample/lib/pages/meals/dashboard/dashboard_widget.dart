import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/meal_card/meal_card_widget.dart';
import '/components/meal_card_loading/meal_card_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_INIT_STATE');
      logFirebaseEvent('Dashboard_haptic_feedback');
      HapticFeedback.mediumImpact();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This week\'s meals',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Made to order with fresh ingredients each week.',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<MealsRecord>>(
                      stream: queryMealsRecord(
                        queryBuilder: (mealsRecord) => mealsRecord.where(
                          'meal_diet',
                          arrayContains:
                              valueOrDefault(currentUserDocument?.diet, ''),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return MealCardLoadingWidget();
                        }
                        List<MealsRecord> gridViewMealsRecordList =
                            snapshot.data!;
                        if (gridViewMealsRecordList.isEmpty) {
                          return Container(
                            width: double.infinity,
                            child: EmptyStateWidget(
                              icon: Icon(
                                Icons.no_food_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 64.0,
                              ),
                              title: 'No Meals',
                              description:
                                  'No meals have been created or match your dietary preferences.',
                            ),
                          );
                        }
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.78,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewMealsRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewMealsRecord =
                                gridViewMealsRecordList[gridViewIndex];
                            return MealCardWidget(
                              key: Key(
                                  'Keykia_${gridViewIndex}_of_${gridViewMealsRecordList.length}'),
                              mealRef: gridViewMealsRecord,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

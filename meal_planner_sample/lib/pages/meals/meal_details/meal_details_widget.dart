import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/components/meal_bottom_sheet/meal_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meal_details_model.dart';
export 'meal_details_model.dart';

class MealDetailsWidget extends StatefulWidget {
  const MealDetailsWidget({
    super.key,
    this.mealRef,
  });

  final MealsRecord? mealRef;

  @override
  State<MealDetailsWidget> createState() => _MealDetailsWidgetState();
}

class _MealDetailsWidgetState extends State<MealDetailsWidget>
    with TickerProviderStateMixin {
  late MealDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealDetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MealDetails'});

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: 450.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            valueOrDefault<String>(
                              widget.mealRef?.mealImage,
                              'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            ),
                          ).image,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 54.0, 24.0, 0.0),
                          child: wrapWithModel(
                            model: _model.customAppbarModel,
                            updateCallback: () => setState(() {}),
                            child: CustomAppbarWidget(
                              backButton: true,
                              actionButton: false,
                              optionsButton: true,
                              actionButtonAction: () async {},
                              optionsButtonAction: () async {
                                logFirebaseEvent(
                                    'MEAL_DETAILS_Container_vg6xlkz2_CALLBACK');
                                logFirebaseEvent('customAppbar_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x00FFFFFF),
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: MealBottomSheetWidget(
                                          mealRef: widget.mealRef,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.mealRef?.mealName,
                                        'Meal Name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 2.0, 0.0, 0.0),
                                      child: StreamBuilder<MealsRecord>(
                                        stream: MealsRecord.getDocument(
                                            widget.mealRef!.reference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 25.0,
                                                height: 25.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final stackMealsRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'MEAL_DETAILS_PAGE_Stack_9idss4zc_ON_TAP');
                                              if (stackMealsRecord.mealFavorites
                                                  .contains(
                                                      currentUserReference)) {
                                                logFirebaseEvent(
                                                    'Stack_haptic_feedback');
                                                HapticFeedback.lightImpact();
                                                logFirebaseEvent(
                                                    'Stack_backend_call');

                                                await widget.mealRef!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'meal_favorites':
                                                          FieldValue
                                                              .arrayRemove([
                                                        currentUserReference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'Stack_haptic_feedback');
                                                HapticFeedback.selectionClick();
                                                logFirebaseEvent(
                                                    'Stack_wait__delay');
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100));
                                                logFirebaseEvent(
                                                    'Stack_haptic_feedback');
                                                HapticFeedback.lightImpact();
                                                logFirebaseEvent(
                                                    'Stack_backend_call');

                                                await widget.mealRef!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'meal_favorites':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Icon(
                                                    Icons
                                                        .favorite_border_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 32.0,
                                                  ),
                                                ),
                                                if (stackMealsRecord
                                                    .mealFavorites
                                                    .contains(
                                                        currentUserReference))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Icon(
                                                      Icons.favorite_rounded,
                                                      color: Color(0xFFFF4E59),
                                                      size: 32.0,
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'iconOnPageLoadAnimation']!),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (widget.mealRef?.mealCalories != null)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      widget.mealRef?.mealCalories?.toString(),
                                      '0',
                                    )} calories',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              if (widget.mealRef?.mealIngredients != null &&
                                  widget.mealRef?.mealIngredients != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ingredients',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                      Text(
                                        widget.mealRef!.mealIngredients,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (widget.mealRef!.mealAllergens.length > 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Allergens',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final allergens = widget
                                                    .mealRef?.mealAllergens
                                                    ?.toList() ??
                                                [];
                                            return Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(
                                                  allergens.length,
                                                  (allergensIndex) {
                                                final allergensItem =
                                                    allergens[allergensIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 8.0),
                                                  child: Container(
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFECAA),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  12.0,
                                                                  24.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            allergensItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xFF81681E),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

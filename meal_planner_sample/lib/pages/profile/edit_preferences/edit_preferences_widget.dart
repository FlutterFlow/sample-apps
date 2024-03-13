import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_appbar_widget.dart';
import '/components/diet_item/diet_item_widget.dart';
import '/components/preference_item/preference_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_preferences_model.dart';
export 'edit_preferences_model.dart';

class EditPreferencesWidget extends StatefulWidget {
  const EditPreferencesWidget({
    super.key,
    required this.page,
  });

  final int? page;

  @override
  State<EditPreferencesWidget> createState() => _EditPreferencesWidgetState();
}

class _EditPreferencesWidgetState extends State<EditPreferencesWidget> {
  late EditPreferencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPreferencesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditPreferences'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_PREFERENCES_EditPreferences_ON_INIT');
      logFirebaseEvent('EditPreferences_update_page_state');
      setState(() {
        _model.allergenSelection =
            (currentUserDocument?.allergens?.toList() ?? [])
                .toList()
                .cast<String>();
        _model.dietSelection = valueOrDefault(currentUserDocument?.diet, '');
        _model.ingredientSelection =
            (currentUserDocument?.ingredientDislikes?.toList() ?? [])
                .toList()
                .cast<String>();
      });
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
    return StreamBuilder<List<OnboardingOptionsRecord>>(
      stream: queryOnboardingOptionsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<OnboardingOptionsRecord>
            editPreferencesOnboardingOptionsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final editPreferencesOnboardingOptionsRecord =
            editPreferencesOnboardingOptionsRecordList.isNotEmpty
                ? editPreferencesOnboardingOptionsRecordList.first
                : null;
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
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.customAppbarModel,
                              updateCallback: () => setState(() {}),
                              child: CustomAppbarWidget(
                                backButton: true,
                                actionButton: false,
                                optionsButton: false,
                                actionButtonAction: () async {},
                                optionsButtonAction: () async {},
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 500.0,
                                child: PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              valueOrDefault<int>(
                                                widget.page,
                                                0,
                                              ),
                                              2)),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            'Update diet',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 18.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final diet =
                                                  editPreferencesOnboardingOptionsRecord
                                                          ?.dietOptions
                                                          ?.toList() ??
                                                      [];
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    diet.length, (dietIndex) {
                                                  final dietItem =
                                                      diet[dietIndex];
                                                  return DietItemWidget(
                                                    key: Key(
                                                        'Keynmz_${dietIndex}_of_${diet.length}'),
                                                    dietType: dietItem.dietName,
                                                    selectedDiet:
                                                        _model.dietSelection!,
                                                    dietTagline:
                                                        dietItem.dietTagline,
                                                    action: () async {
                                                      logFirebaseEvent(
                                                          'EDIT_PREFERENCES_Container_nmzhibnb_CALL');
                                                      logFirebaseEvent(
                                                          'dietItem_haptic_feedback');
                                                      HapticFeedback
                                                          .selectionClick();
                                                      logFirebaseEvent(
                                                          'dietItem_update_page_state');
                                                      setState(() {
                                                        _model.dietSelection =
                                                            dietItem.dietName;
                                                      });
                                                    },
                                                  );
                                                }).divide(
                                                    SizedBox(height: 8.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            'Update allergies',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 18.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final allergens =
                                                      editPreferencesOnboardingOptionsRecord
                                                              ?.allergenOptions
                                                              ?.toList() ??
                                                          [];
                                                  return Wrap(
                                                    spacing: 8.0,
                                                    runSpacing: 8.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        allergens.length,
                                                        (allergensIndex) {
                                                      final allergensItem =
                                                          allergens[
                                                              allergensIndex];
                                                      return PreferenceItemWidget(
                                                        key: Key(
                                                            'Key2pp_${allergensIndex}_of_${allergens.length}'),
                                                        text: allergensItem,
                                                        selectedItems: _model
                                                            .allergenSelection,
                                                        action: () async {
                                                          logFirebaseEvent(
                                                              'EDIT_PREFERENCES_Container_2pp5tbdq_CALL');
                                                          if (_model
                                                              .allergenSelection
                                                              .contains(
                                                                  allergensItem)) {
                                                            logFirebaseEvent(
                                                                'preferenceItem_haptic_feedback');
                                                            HapticFeedback
                                                                .selectionClick();
                                                            logFirebaseEvent(
                                                                'preferenceItem_update_page_state');
                                                            setState(() {
                                                              _model.removeFromAllergenSelection(
                                                                  allergensItem);
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'preferenceItem_haptic_feedback');
                                                            HapticFeedback
                                                                .selectionClick();
                                                            logFirebaseEvent(
                                                                'preferenceItem_update_page_state');
                                                            setState(() {
                                                              _model.addToAllergenSelection(
                                                                  allergensItem);
                                                            });
                                                          }
                                                        },
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            'Update dislikes',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 18.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final dislikes =
                                                      editPreferencesOnboardingOptionsRecord
                                                              ?.ingredientOptions
                                                              ?.toList() ??
                                                          [];
                                                  return Wrap(
                                                    spacing: 8.0,
                                                    runSpacing: 8.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        dislikes.length,
                                                        (dislikesIndex) {
                                                      final dislikesItem =
                                                          dislikes[
                                                              dislikesIndex];
                                                      return PreferenceItemWidget(
                                                        key: Key(
                                                            'Keyarx_${dislikesIndex}_of_${dislikes.length}'),
                                                        text: dislikesItem,
                                                        selectedItems: _model
                                                            .ingredientSelection,
                                                        action: () async {
                                                          logFirebaseEvent(
                                                              'EDIT_PREFERENCES_Container_arxiy5m7_CALL');
                                                          if (_model
                                                              .ingredientSelection
                                                              .contains(
                                                                  dislikesItem)) {
                                                            logFirebaseEvent(
                                                                'preferenceItem_haptic_feedback');
                                                            HapticFeedback
                                                                .selectionClick();
                                                            logFirebaseEvent(
                                                                'preferenceItem_update_page_state');
                                                            setState(() {
                                                              _model.removeFromIngredientSelection(
                                                                  dislikesItem);
                                                            });
                                                          } else {
                                                            logFirebaseEvent(
                                                                'preferenceItem_haptic_feedback');
                                                            HapticFeedback
                                                                .selectionClick();
                                                            logFirebaseEvent(
                                                                'preferenceItem_update_page_state');
                                                            setState(() {
                                                              _model.addToIngredientSelection(
                                                                  dislikesItem);
                                                            });
                                                          }
                                                        },
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 12.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_PREFERENCES_PAGE_UPDATE_BTN_ON_TAP');
                        logFirebaseEvent('Button_haptic_feedback');
                        HapticFeedback.lightImpact();
                        logFirebaseEvent('Button_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            diet: _model.dietSelection,
                          ),
                          ...mapToFirestore(
                            {
                              'allergens': _model.allergenSelection,
                              'ingredient_dislikes': _model.ingredientSelection,
                            },
                          ),
                        });
                        logFirebaseEvent('Button_navigate_back');
                        context.pop();
                      },
                      text: 'Update',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall,
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

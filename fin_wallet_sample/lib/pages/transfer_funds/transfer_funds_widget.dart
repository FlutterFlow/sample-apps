import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transfer_funds_model.dart';
export 'transfer_funds_model.dart';

class TransferFundsWidget extends StatefulWidget {
  const TransferFundsWidget({super.key});

  @override
  State<TransferFundsWidget> createState() => _TransferFundsWidgetState();
}

class _TransferFundsWidgetState extends State<TransferFundsWidget>
    with TickerProviderStateMixin {
  late TransferFundsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.4, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 47.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 140.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 270.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 270.ms,
          duration: 600.ms,
          begin: Offset(0.0, 82.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 270.ms,
          duration: 600.ms,
          begin: Offset(1.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: -220.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: -220.ms,
          duration: 600.ms,
          begin: Offset(0.4, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: -220.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: -220.ms,
          duration: 600.ms,
          begin: Offset(0.4, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransferFundsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiary,
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
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.84,
              ),
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'pe3o18oh' /* Transfer Funds */,
                          ),
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 16.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Color(0x4B1A1F24),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.94, -1.0),
                            end: AlignmentDirectional(-0.94, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 12.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'kyzwrfh4' /* Balance */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 4.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'zq4ozx20' /* $7,630 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                          fontSize: 32.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 4.0, 20.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qukh7yo1' /* **** 0149 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'n87hkr7d' /* 05/25 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        '3ct4fj7p' /* Change Account */,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context).bodySmall,
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation']!),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController1 ??=
                            FormFieldController<String>(null),
                        options: [
                          FFLocalizations.of(context).getText(
                            'w4smsh2i' /* Internal Transfer */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6uxty3hy' /* External Transfer */,
                          ),
                          FFLocalizations.of(context).getText(
                            'p4ngma0d' /* ACH Payment */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue1 = val),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 60.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'uxo87fjc' /* Transfer Type */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).grayLight,
                          size: 15.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 12.0, 20.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ).animateOnPageLoad(
                          animationsMap['dropDownOnPageLoadAnimation1']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(null),
                        options: [
                          FFLocalizations.of(context).getText(
                            'fddma8xl' /* Select Account */,
                          ),
                          FFLocalizations.of(context).getText(
                            '23l6kqgm' /* Account ****2010 */,
                          ),
                          FFLocalizations.of(context).getText(
                            '3hwdfadf' /* Account ****2011 */,
                          ),
                          FFLocalizations.of(context).getText(
                            'xvj00xg1' /* Account ****2012 */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue2 = val),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 60.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'ok5xluvk' /* Choose an Account */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).grayLight,
                          size: 15.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 12.0, 20.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ).animateOnPageLoad(
                          animationsMap['dropDownOnPageLoadAnimation2']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'ynie0pc5' /* $ Amount */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontWeight: FontWeight.w300,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 24.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).displaySmall,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ).animateOnPageLoad(
                          animationsMap['textFieldOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'wngoi0v4' /* Your new account balance is: */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'g6bfec2g' /* $7,630 */,
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation1']!),
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
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'transferComplete',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 220),
                            ),
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'xaw2jdst' /* Send Transfer */,
                      ),
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 70.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).textColor,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation2']!),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'xku4zxbe' /* Tap above to complete transfer */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend',
                  color: Color(0x43000000),
                ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'request_funds_model.dart';
export 'request_funds_model.dart';

class RequestFundsWidget extends StatefulWidget {
  const RequestFundsWidget({super.key});

  @override
  State<RequestFundsWidget> createState() => _RequestFundsWidgetState();
}

class _RequestFundsWidgetState extends State<RequestFundsWidget> {
  late RequestFundsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestFundsModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
                            'wv1862li' /* Request Funds */,
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontWeight: FontWeight.w300,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'xvj3fan8' /* $ Amount */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontWeight: FontWeight.w300,
                              ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
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
                        textAlign: TextAlign.center,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: [
                          FFLocalizations.of(context).getText(
                            'wwjahvpl' /* Office Budget */,
                          ),
                          FFLocalizations.of(context).getText(
                            'sx0vvzxd' /* External Transfer */,
                          ),
                          FFLocalizations.of(context).getText(
                            'ai453kej' /* ACH Payment */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 60.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'wo9cebk7' /* Select Transfer */,
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
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'rcevwwju' /* Reason */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).bodyMedium,
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
                              20.0, 32.0, 24.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        validator: _model.textController2Validator
                            .asValidator(context),
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
                        'uvrt7im0' /* Request Funds */,
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
            ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              '7y89msg9' /* Tap above to complete request */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend',
                  color: Color(0x43000000),
                ),
          ),
        ],
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_old_model.dart';
export 'booking_old_model.dart';

class BookingOldWidget extends StatefulWidget {
  const BookingOldWidget({
    super.key,
    this.userProfile,
  });

  final DocumentReference? userProfile;

  @override
  State<BookingOldWidget> createState() => _BookingOldWidgetState();
}

class _BookingOldWidgetState extends State<BookingOldWidget> {
  late BookingOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingOldModel());

    _model.emailFocusNode ??= FocusNode();

    _model.personsNameFocusNode ??= FocusNode();

    _model.problemDescriptionController ??= TextEditingController();
    _model.problemDescriptionFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).darkBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference!),
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
            final columnUsersRecord = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 3.0,
                    indent: 150.0,
                    endIndent: 150.0,
                    color: Color(0xFF465056),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '8laf5zmk' /* Book Appointment */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'udwhsu8p' /* Fill out the information below... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.emailController ??=
                          TextEditingController(
                        text: columnUsersRecord.email,
                      ),
                      focusNode: _model.emailFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'm6f5lawq' /* Email Address */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).background,
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
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).darkBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.bold,
                          ),
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          _model.emailControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.personsNameController ??=
                          TextEditingController(
                        text: columnUsersRecord.displayName,
                      ),
                      focusNode: _model.personsNameFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'yz52729g' /* Booking For */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).background,
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
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).darkBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).textColor,
                            fontWeight: FontWeight.bold,
                          ),
                      validator: _model.personsNameControllerValidator
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
                          'hdmqdmzq' /* Type of Appointment */,
                        ),
                        FFLocalizations.of(context).getText(
                          'stpxpct6' /* Doctors Visit */,
                        ),
                        FFLocalizations.of(context).getText(
                          'wvgk6obb' /* Routine Checkup */,
                        ),
                        FFLocalizations.of(context).getText(
                          'xt7ujyt8' /* Scan/Update */,
                        )
                      ],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue = val),
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 60.0,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).grayLight,
                        size: 15.0,
                      ),
                      fillColor: FlutterFlowTheme.of(context).darkBackground,
                      elevation: 3.0,
                      borderColor: FlutterFlowTheme.of(context).background,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.problemDescriptionController,
                      focusNode: _model.problemDescriptionFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'andpn0t0' /* What's the problem? */,
                        ),
                        labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).background,
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
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).darkBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).textColor,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      validator: _model.problemDescriptionControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            safeSetState(() {
                              _model.datePicked = date;
                            });
                          },
                          currentTime: getCurrentTimestamp,
                          minTime: DateTime(0, 0, 0),
                          locale: LocaleType.values.firstWhere(
                            (l) =>
                                l.name ==
                                FFLocalizations.of(context).languageCode,
                            orElse: () => LocaleType.en,
                          ),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).darkBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).background,
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ycaso9dc' /* Choose Date */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        dateTimeFormat(
                                          'MMMMEEEEd',
                                          _model.datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 46.0,
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        size: 25.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pop();
                          },
                          text: FFLocalizations.of(context).getText(
                            '2pmd2p3w' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).background,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await AppointmentsRecord.collection
                                .doc()
                                .set(createAppointmentsRecordData(
                                  appointmentType: _model.dropDownValue,
                                  appointmentTime: _model.datePicked,
                                  appointmentName:
                                      _model.personsNameController.text,
                                  appointmentDescription:
                                      _model.problemDescriptionController.text,
                                  appointmentEmail: currentUserEmail,
                                ));
                            context.pop();
                          },
                          text: FFLocalizations.of(context).getText(
                            '13j05r8j' /* Book Now */,
                          ),
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

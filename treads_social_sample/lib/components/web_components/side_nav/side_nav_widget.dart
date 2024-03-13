import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_nav_model.dart';
export 'side_nav_model.dart';

class SideNavWidget extends StatefulWidget {
  const SideNavWidget({
    super.key,
    int? selectedNav,
  }) : this.selectedNav = selectedNav ?? 1;

  final int selectedNav;

  @override
  State<SideNavWidget> createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  late SideNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Make this side nav a component. You can then set the colors of the icons to be selected base on an integer.
        Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          width: 72.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: Offset(1.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent4,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo should go here.
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Icon(
                    Icons.alternate_email_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 40.0,
                  ),
                ),
                Divider(
                  height: 12.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).accent1,
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'main_Feed',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: () {
                          if (widget.selectedNav == 1) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else if (_model.mouseRegionHovered1!) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else {
                            return FlutterFlowTheme.of(context).primary;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.selectedNav == 1) {
                                return FlutterFlowTheme.of(context).accent1;
                              } else if (_model.mouseRegionHovered1!) {
                                return FlutterFlowTheme.of(context).accent1;
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.house_outlined,
                          color: widget.selectedNav == 1
                              ? FlutterFlowTheme.of(context).info
                              : FlutterFlowTheme.of(context).accent4,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered1 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered1 = false);
                  }),
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'main_Chat',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: () {
                          if (widget.selectedNav == 2) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else if (_model.mouseRegionHovered2!) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else {
                            return FlutterFlowTheme.of(context).primary;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: () {
                            if (widget.selectedNav == 2) {
                              return FlutterFlowTheme.of(context).accent1;
                            } else if (_model.mouseRegionHovered2!) {
                              return FlutterFlowTheme.of(context).accent1;
                            } else {
                              return FlutterFlowTheme.of(context).primary;
                            }
                          }(),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.forum_rounded,
                          color: widget.selectedNav == 2
                              ? FlutterFlowTheme.of(context).info
                              : FlutterFlowTheme.of(context).accent4,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered2 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered2 = false);
                  }),
                ),
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'main_Profile',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: () {
                          if (widget.selectedNav == 3) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else if (_model.mouseRegionHovered3!) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else {
                            return FlutterFlowTheme.of(context).primary;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.selectedNav == 3) {
                                return FlutterFlowTheme.of(context).accent1;
                              } else if (_model.mouseRegionHovered3!) {
                                return FlutterFlowTheme.of(context).accent1;
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: widget.selectedNav == 3
                              ? FlutterFlowTheme.of(context).info
                              : FlutterFlowTheme.of(context).accent4,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered3 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered3 = false);
                  }),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}

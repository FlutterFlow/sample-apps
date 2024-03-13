import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_modal/create_modal_widget.dart';
import '/components/empty_list_1/empty_list1_widget.dart';
import '/components/web_components/post_modal_view/post_modal_view_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/components/web_components/story_modal_view/story_modal_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_feed_model.dart';
export 'main_feed_model.dart';

class MainFeedWidget extends StatefulWidget {
  const MainFeedWidget({super.key});

  @override
  State<MainFeedWidget> createState() => _MainFeedWidgetState();
}

class _MainFeedWidgetState extends State<MainFeedWidget>
    with TickerProviderStateMixin {
  late MainFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconTriggered = false;
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.2, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainFeedModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: Visibility(
        visible: MediaQuery.sizeOf(context).width <= 990.0,
        child: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0x00000000),
              barrierColor: FlutterFlowTheme.of(context).accent4,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: CreateModalWidget(),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.create_rounded,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ),
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Icon(
                      Icons.alternate_email_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 44.0,
                    ),
                  ),
                  Text(
                    'treads.io',
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            )
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: SideNavWidget(
              selectedNav: 1,
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 1070.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  Icons.alternate_email_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 44.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Text(
                                    'treads.io',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Color(0x00000000),
                                      barrierColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: CreateModalWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: 'New Post',
                                  icon: Icon(
                                    Icons.mode_edit,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 44.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: Colors.white,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Container(
                        height: 76.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context).alternate,
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 8.0),
                          child: StreamBuilder<List<UserStoriesRecord>>(
                            stream: queryUserStoriesRecord(
                              queryBuilder: (userStoriesRecord) =>
                                  userStoriesRecord.orderBy('storyPostedAt',
                                      descending: true),
                              limit: 20,
                            ),
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
                              List<UserStoriesRecord>
                                  listViewUserStoriesRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewUserStoriesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewUserStoriesRecord =
                                      listViewUserStoriesRecordList[
                                          listViewIndex];
                                  return Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewUserStoriesRecord.user!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
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
                                          final columnUsersRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (MediaQuery.sizeOf(context)
                                                      .width >=
                                                  1270.0) {
                                                await showDialog(
                                                  barrierColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          StoryModalViewWidget(
                                                        initialIndex:
                                                            listViewIndex,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              } else {
                                                context.pushNamed(
                                                  'storyDetails',
                                                  queryParameters: {
                                                    'initialStoryIndex':
                                                        serializeParam(
                                                      listViewIndex,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .bottomToTop,
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                    ),
                                                  },
                                                );
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            columnUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/ecyxfirnulof/karsten-winegeart-BJaqPaH6AGQ-unsplash.jpg',
                                                          ),
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      columnUsersRecord
                                                          .displayName,
                                                      'Ellie May',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 8,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: StreamBuilder<List<UserPostsRecord>>(
                          stream: queryUserPostsRecord(
                            queryBuilder: (userPostsRecord) => userPostsRecord
                                .orderBy('timePosted', descending: true),
                            limit: 50,
                          ),
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
                            List<UserPostsRecord>
                                socialFeedUserPostsRecordList = snapshot.data!;
                            if (socialFeedUserPostsRecordList.isEmpty) {
                              return Center(
                                child: Container(
                                  width: 330.0,
                                  height: 330.0,
                                  child: EmptyList1Widget(),
                                ),
                              );
                            }
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  socialFeedUserPostsRecordList.length,
                                  (socialFeedIndex) {
                                final socialFeedUserPostsRecord =
                                    socialFeedUserPostsRecordList[
                                        socialFeedIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: FutureBuilder<UsersRecord>(
                                    future: UsersRecord.getDocumentOnce(
                                        socialFeedUserPostsRecord.postUser!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final userPostUsersRecord =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 670.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (MediaQuery.sizeOf(context)
                                                      .width >=
                                                  1271.0) {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          PostModalViewWidget(
                                                        postRef:
                                                            socialFeedUserPostsRecord,
                                                        userRef:
                                                            userPostUsersRecord,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              } else {
                                                context.pushNamed(
                                                  'postDetails_Page',
                                                  queryParameters: {
                                                    'userRecord':
                                                        serializeParam(
                                                      userPostUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                    'postReference':
                                                        serializeParam(
                                                      socialFeedUserPostsRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userRecord':
                                                        userPostUsersRecord,
                                                    'postReference':
                                                        socialFeedUserPostsRecord,
                                                  },
                                                );
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 1.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'viewProfilePageOther',
                                                            queryParameters: {
                                                              'userDetails':
                                                                  serializeParam(
                                                                userPostUsersRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'showPage':
                                                                  serializeParam(
                                                                false,
                                                                ParamType.bool,
                                                              ),
                                                              'pageTitle':
                                                                  serializeParam(
                                                                'Home',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'userDetails':
                                                                  userPostUsersRecord,
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 44.0,
                                                              height: 44.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        userPostUsersRecord
                                                                            .photoUrl,
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        userPostUsersRecord
                                                                            .displayName,
                                                                        'My Name',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          userPostUsersRecord
                                                                              .userName,
                                                                          '@noone',
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
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowMediaDisplay(
                                                  path:
                                                      socialFeedUserPostsRecord
                                                          .postPhoto,
                                                  imageBuilder: (path) =>
                                                      CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 0),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 0),
                                                    imageUrl: path,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 350.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  videoPlayerBuilder: (path) =>
                                                      FlutterFlowVideoPlayer(
                                                    path: path,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    autoPlay: true,
                                                    looping: true,
                                                    showControls: false,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 41.0,
                                                                  height: 41.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      if (!socialFeedUserPostsRecord
                                                                          .likes
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.25),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await socialFeedUserPostsRecord.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'likes': FieldValue.arrayUnion([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                              if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                                                                                setState(() => hasIconTriggered = true);
                                                                                SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['iconOnActionTriggerAnimation']!.controller.forward(from: 0.0));
                                                                              }
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_border,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 25.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (socialFeedUserPostsRecord
                                                                          .likes
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.25),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await socialFeedUserPostsRecord.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'likes': FieldValue.arrayRemove([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  },
                                                                                ),
                                                                              });
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 25.0,
                                                                            ),
                                                                          ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation']!, hasBeenTriggered: hasIconTriggered),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions
                                                                          .likes(
                                                                              socialFeedUserPostsRecord)
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .mode_comment_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  socialFeedUserPostsRecord
                                                                      .numComments
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                                'relative',
                                                                socialFeedUserPostsRecord
                                                                    .timePosted!),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 4.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              socialFeedUserPostsRecord
                                                                  .postDescription,
                                                              'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
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
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

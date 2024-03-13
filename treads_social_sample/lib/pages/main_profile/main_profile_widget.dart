import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_list/user_list_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/updated_chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_profile_model.dart';
export 'main_profile_model.dart';

class MainProfileWidget extends StatefulWidget {
  const MainProfileWidget({super.key});

  @override
  State<MainProfileWidget> createState() => _MainProfileWidgetState();
}

class _MainProfileWidgetState extends State<MainProfileWidget>
    with TickerProviderStateMixin {
  late MainProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainProfileModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final mainProfileUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                child: SideNavWidget(
                  selectedNav: 3,
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
                    decoration: BoxDecoration(),
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
                                0.0, 32.0, 0.0, 12.0),
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
                              ],
                            ),
                          ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            constraints: BoxConstraints(
                              maxWidth: 870.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      width: 300.0,
                                      height: 64.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.85, 0.68),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      mainProfileUsersRecord
                                                          .photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/5lywt4ult0tj/flouffy-qEO5MpLyOks-unsplash.jpg',
                                                    ),
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  mainProfileUsersRecord
                                                      .displayName,
                                                  'UserName',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    mainProfileUsersRecord
                                                        .email,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    mainProfileUsersRecord.bio,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 8.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        'editSettings',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration:
                                                Duration(milliseconds: 250),
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Settings',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Figtree',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          unselectedLabelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          indicatorWeight: 2.0,
                                          tabs: [
                                            Tab(
                                              text: 'My Posts',
                                            ),
                                            Tab(
                                              text: 'Friends',
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [() async {}, () async {}][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 32.0),
                                              child: StreamBuilder<
                                                  List<UserPostsRecord>>(
                                                stream: queryUserPostsRecord(
                                                  queryBuilder:
                                                      (userPostsRecord) =>
                                                          userPostsRecord
                                                              .where(
                                                                'postUser',
                                                                isEqualTo:
                                                                    mainProfileUsersRecord
                                                                        .reference,
                                                              )
                                                              .orderBy(
                                                                  'timePosted',
                                                                  descending:
                                                                      true),
                                                ),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UserPostsRecord>
                                                      socialFeedUserPostsRecordList =
                                                      snapshot.data!;
                                                  if (socialFeedUserPostsRecordList
                                                      .isEmpty) {
                                                    return Center(
                                                      child: Image.asset(
                                                        'assets/images/emptyPosts@2x.png',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height: 400.0,
                                                      ),
                                                    );
                                                  }
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        socialFeedUserPostsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 1.0),
                                                    itemBuilder: (context,
                                                        socialFeedIndex) {
                                                      final socialFeedUserPostsRecord =
                                                          socialFeedUserPostsRecordList[
                                                              socialFeedIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  socialFeedUserPostsRecord
                                                                      .postUser!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final userPostUsersRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            1.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'postDetails_Page',
                                                                    queryParameters:
                                                                        {
                                                                      'userRecord':
                                                                          serializeParam(
                                                                        userPostUsersRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'postReference':
                                                                          serializeParam(
                                                                        socialFeedUserPostsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'userRecord':
                                                                          userPostUsersRecord,
                                                                      'postReference':
                                                                          socialFeedUserPostsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          2.0,
                                                                          4.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 36.0,
                                                                              height: 36.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 2.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(2.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      userPostUsersRecord.photoUrl,
                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/wn636nykq7im/lucrezia-carnelos-0liYTl4dJxk-unsplash.jpg',
                                                                                    ),
                                                                                    width: 300.0,
                                                                                    height: 200.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      userPostUsersRecord.userName,
                                                                                      'myUsername',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                  ),
                                                                                ),
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  buttonSize: 46.0,
                                                                                  icon: Icon(
                                                                                    Icons.keyboard_control,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          socialFeedUserPostsRecord
                                                                              .postPhoto,
                                                                          'https://d.newsweek.com/en/full/1310267/best-hawaii-beaches.jpg',
                                                                        ),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            300.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    ToggleIcon(
                                                                                      onPressed: () async {
                                                                                        final likesElement = mainProfileUsersRecord.reference;
                                                                                        final likesUpdate = socialFeedUserPostsRecord.likes.contains(likesElement) ? FieldValue.arrayRemove([likesElement]) : FieldValue.arrayUnion([likesElement]);
                                                                                        await socialFeedUserPostsRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'likes': likesUpdate,
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                                      value: socialFeedUserPostsRecord.likes.contains(mainProfileUsersRecord.reference),
                                                                                      onIcon: Icon(
                                                                                        Icons.favorite_rounded,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 25.0,
                                                                                      ),
                                                                                      offIcon: Icon(
                                                                                        Icons.favorite_border,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 25.0,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions.likes(socialFeedUserPostsRecord).toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.mode_comment_outlined,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      socialFeedUserPostsRecord.numComments.toString(),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall,
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 8.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat('relative', socialFeedUserPostsRecord.timePosted!),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  socialFeedUserPostsRecord.postDescription,
                                                                                  'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: StreamBuilder<
                                                  List<FriendsRecord>>(
                                                stream: queryFriendsRecord(
                                                  queryBuilder:
                                                      (friendsRecord) =>
                                                          friendsRecord.where(
                                                    'followee',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                                ),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<FriendsRecord>
                                                      listViewFriendsRecordList =
                                                      snapshot.data!;
                                                  if (listViewFriendsRecordList
                                                      .isEmpty) {
                                                    return Center(
                                                      child:
                                                          EmptyStateSimpleWidget(
                                                        icon: Icon(
                                                          Icons.groups_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 72.0,
                                                        ),
                                                        title: 'No Friends',
                                                        body:
                                                            'You don\'t have any friends.',
                                                      ),
                                                    );
                                                  }
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewFriendsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 1.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewFriendsRecord =
                                                          listViewFriendsRecordList[
                                                              listViewIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .userListModels
                                                            .getModel(
                                                          listViewFriendsRecord
                                                              .reference.id,
                                                          listViewIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child: UserListWidget(
                                                          key: Key(
                                                            'Keyjbr_${listViewFriendsRecord.reference.id}',
                                                          ),
                                                          userRef:
                                                              listViewFriendsRecord
                                                                  .follower!,
                                                        ),
                                                      );
                                                    },
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import '/backend/backend.dart';
import '/components/comments/comments_widget.dart';
import '/components/delete_story/delete_story_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stories_model.dart';
export 'stories_model.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({
    super.key,
    this.initialIndex,
  });

  final int? initialIndex;

  @override
  State<StoriesWidget> createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  late StoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: StreamBuilder<List<UserStoriesRecord>>(
            stream: queryUserStoriesRecord(
              queryBuilder: (userStoriesRecord) =>
                  userStoriesRecord.orderBy('storyPostedAt', descending: true),
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
              List<UserStoriesRecord> pageViewUserStoriesRecordList =
                  snapshot.data!;
              return Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: min(
                              valueOrDefault<int>(
                                widget.initialIndex,
                                0,
                              ),
                              pageViewUserStoriesRecordList.length - 1)),
                      scrollDirection: Axis.vertical,
                      itemCount: pageViewUserStoriesRecordList.length,
                      itemBuilder: (context, pageViewIndex) {
                        final pageViewUserStoriesRecord =
                            pageViewUserStoriesRecordList[pageViewIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height * 0.82,
                              child: Stack(
                                children: [
                                  if (pageViewUserStoriesRecord.storyPhoto !=
                                          null &&
                                      pageViewUserStoriesRecord.storyPhoto !=
                                          '')
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          pageViewUserStoriesRecord.storyPhoto,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/be7tvmob7nwb/richard-brutyo-Sg3XwuEpybU-unsplash.jpg',
                                        ),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (pageViewUserStoriesRecord.storyVideo !=
                                          null &&
                                      pageViewUserStoriesRecord.storyVideo !=
                                          '')
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowVideoPlayer(
                                        path: pageViewUserStoriesRecord
                                            .storyVideo,
                                        videoType: VideoType.network,
                                        aspectRatio: 1.70,
                                        autoPlay: true,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 102.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1A1F24),
                                                Color(0x001A1F24)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 36.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      pageViewUserStoriesRecord
                                                          .user!),
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
                                                    final userInfoUsersRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              userInfoUsersRecord
                                                                  .photoUrl,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/gu4akoa3hju1/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg',
                                                            ),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Expanded(
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    userInfoUsersRecord
                                                                        .displayName,
                                                                    'Good Dog',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  userInfoUsersRecord
                                                                      .userName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        color: Color(
                                                                            0xCCFFFFFF),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (pageViewUserStoriesRecord
                                                            .isOwner)
                                                          Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: Color(
                                                                0xFF262D34),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          60.0),
                                                            ),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              buttonSize: 46.0,
                                                              icon: Icon(
                                                                Icons.more_vert,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 25.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            240.0,
                                                                        child:
                                                                            DeleteStoryWidget(
                                                                          storyDetails:
                                                                              pageViewUserStoriesRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                            ),
                                                          ),
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color:
                                                              Color(0xFF262D34),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60.0),
                                                          ),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            buttonSize: 46.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .close_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 25.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pop();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x001A1F24),
                                                Color(0xFF1A1F24)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    pageViewUserStoriesRecord
                                                        .storyDescription,
                                                    'This is where the comment will go, okay! I can\'t beleive this is what it seems like!',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        barrierColor: Color(0x00000000),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CommentsWidget(
                                              story: pageViewUserStoriesRecord,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.mode_comment_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            pageViewUserStoriesRecord
                                                .numComments
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.95, 0.7),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage: min(
                                      valueOrDefault<int>(
                                        widget.initialIndex,
                                        0,
                                      ),
                                      pageViewUserStoriesRecordList.length -
                                          1)),
                          count: pageViewUserStoriesRecordList.length,
                          axisDirection: Axis.vertical,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 2.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 8.0,
                            dotHeight: 4.0,
                            dotColor: FlutterFlowTheme.of(context).accent1,
                            activeDotColor:
                                FlutterFlowTheme.of(context).primary,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

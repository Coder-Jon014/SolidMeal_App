import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/create_note_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'details_screen_database_model.dart';
export 'details_screen_database_model.dart';

class DetailsScreenDatabaseWidget extends StatefulWidget {
  const DetailsScreenDatabaseWidget({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  final int? recipeId;

  @override
  _DetailsScreenDatabaseWidgetState createState() =>
      _DetailsScreenDatabaseWidgetState();
}

class _DetailsScreenDatabaseWidgetState
    extends State<DetailsScreenDatabaseWidget> {
  late DetailsScreenDatabaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsScreenDatabaseModel());

    _model.shortBioController1 ??= TextEditingController();
    _model.shortBioController2 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<RecipesRecord>>(
      stream: queryRecipesRecord(
        queryBuilder: (recipesRecord) =>
            recipesRecord.where('recipe_id', isEqualTo: widget.recipeId),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: SpinKitPulse(
                color: Color(0xFF4B39EF),
                size: 150,
              ),
            ),
          );
        }
        List<RecipesRecord> detailsScreenDatabaseRecipesRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final detailsScreenDatabaseRecipesRecord =
            detailsScreenDatabaseRecipesRecordList.isNotEmpty
                ? detailsScreenDatabaseRecipesRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          body: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 286,
                              child: Stack(
                                alignment: AlignmentDirectional(-0.95, -0.7),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -1.13),
                                    child: Image.network(
                                      detailsScreenDatabaseRecipesRecord!
                                          .recipeImage!,
                                      width: MediaQuery.of(context).size.width,
                                      height: 179,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Align(
                                      alignment:
                                          AlignmentDirectional(0.87, -0.54),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Share.share(
                                            detailsScreenDatabaseRecipesRecord!
                                                .recipeURL!,
                                            sharePositionOrigin:
                                                getWidgetBoundingBox(context),
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF5F5F5),
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Icon(
                                              Icons.ios_share,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.95, -0.55),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('Home');
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Icon(
                                            Icons.arrow_back_rounded,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.87, 0.82),
                                    child:
                                        StreamBuilder<List<UserFavoriteRecord>>(
                                      stream: queryUserFavoriteRecord(
                                        queryBuilder: (userFavoriteRecord) =>
                                            userFavoriteRecord.where('userId',
                                                isEqualTo: currentUserUid),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: SpinKitPulse(
                                                color: Color(0xFF4B39EF),
                                                size: 150,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UserFavoriteRecord>
                                            toggleIconUserFavoriteRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final toggleIconUserFavoriteRecord =
                                            toggleIconUserFavoriteRecordList
                                                    .isNotEmpty
                                                ? toggleIconUserFavoriteRecordList
                                                    .first
                                                : null;
                                        return ToggleIcon(
                                          onPressed: () async {
                                            final recipeIdElement =
                                                widget.recipeId;
                                            final recipeIdUpdate =
                                                toggleIconUserFavoriteRecord!
                                                        .recipeId!
                                                        .toList()
                                                        .contains(
                                                            recipeIdElement)
                                                    ? FieldValue.arrayRemove(
                                                        [recipeIdElement])
                                                    : FieldValue.arrayUnion(
                                                        [recipeIdElement]);
                                            final userFavoriteUpdateData = {
                                              'recipeId': recipeIdUpdate,
                                            };
                                            await toggleIconUserFavoriteRecord!
                                                .reference
                                                .update(userFavoriteUpdateData);
                                            if (toggleIconUserFavoriteRecord!
                                                .recipeId!
                                                .toList()
                                                .contains(widget.recipeId)) {
                                              final userFavoriteUpdateData1 = {
                                                'recipeId':
                                                    FieldValue.arrayRemove(
                                                        [widget.recipeId]),
                                              };
                                              await toggleIconUserFavoriteRecord!
                                                  .reference
                                                  .update(
                                                      userFavoriteUpdateData1);
                                            } else {
                                              final userFavoriteUpdateData2 = {
                                                'recipeId':
                                                    FieldValue.arrayUnion(
                                                        [widget.recipeId]),
                                              };
                                              await toggleIconUserFavoriteRecord!
                                                  .reference
                                                  .update(
                                                      userFavoriteUpdateData2);
                                            }
                                          },
                                          value: toggleIconUserFavoriteRecord!
                                              .recipeId!
                                              .toList()
                                              .contains(widget.recipeId),
                                          onIcon: Icon(
                                            Icons.favorite,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40,
                                          ),
                                          offIcon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1.01),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 90, 0),
                                                child: AutoSizeText(
                                                  detailsScreenDatabaseRecipesRecord!
                                                      .recipeTitle!,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 10, 0, 0),
                                          child: Text(
                                            'Ready In: ${detailsScreenDatabaseRecipesRecord!.recipeHealthScore?.toString()} minutes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'Serving Size: ${detailsScreenDatabaseRecipesRecord!.servings?.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
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
                      Divider(),
                      Expanded(
                        child: DefaultTabController(
                          length: 6,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.black,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 16,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  tabs: [
                                    Tab(
                                      text: 'Ingredients',
                                      icon: Icon(
                                        Icons.fastfood_sharp,
                                        color: Colors.black,
                                      ),
                                      iconMargin:
                                          EdgeInsetsDirectional.fromSTEB(
                                              1, 1, 1, 1),
                                    ),
                                    Tab(
                                      text: 'Instructions',
                                      icon: FaIcon(
                                        FontAwesomeIcons.bookOpen,
                                        color: Colors.black,
                                      ),
                                      iconMargin:
                                          EdgeInsetsDirectional.fromSTEB(
                                              1, 1, 1, 1),
                                    ),
                                    Tab(
                                      text: 'Health',
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                      ),
                                      iconMargin:
                                          EdgeInsetsDirectional.fromSTEB(
                                              1, 1, 1, 1),
                                    ),
                                    Tab(
                                      text: 'Review',
                                      icon: Icon(
                                        Icons.rate_review,
                                      ),
                                    ),
                                    Tab(
                                      text: 'Similar',
                                      icon: Icon(
                                        Icons.more,
                                      ),
                                    ),
                                    Tab(
                                      text: 'My Notes',
                                      icon: FaIcon(
                                        FontAwesomeIcons.receipt,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 10),
                                                child: Builder(
                                                  builder: (context) {
                                                    final ingredients =
                                                        detailsScreenDatabaseRecipesRecord!
                                                            .recipeIngredients!
                                                            .toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          ingredients.length,
                                                      itemBuilder: (context,
                                                          ingredientsIndex) {
                                                        final ingredientsItem =
                                                            ingredients[
                                                                ingredientsIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(15,
                                                                      0, 0, 10),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .fastfood_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${ingredientsItem}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.75,
                                                                          0),
                                                                  child: Text(
                                                                    '${detailsScreenDatabaseRecipesRecord!.recipeIngredientAmount!.toList()[ingredientsIndex].toString()} ${detailsScreenDatabaseRecipesRecord!.recipeIngredientUnit!.toList()[ingredientsIndex]}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              16,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 10),
                                                child: Builder(
                                                  builder: (context) {
                                                    final instructions =
                                                        detailsScreenDatabaseRecipesRecord!
                                                            .recipeInstructiona!
                                                            .toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          instructions.length,
                                                      itemBuilder: (context,
                                                          instructionsIndex) {
                                                        final instructionsItem =
                                                            instructions[
                                                                instructionsIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .utensilSpoon,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                child: Text(
                                                                  '${instructionsItem}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Stack(
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (detailsScreenDatabaseRecipesRecord!
                                                          .recipeHealthScore! >
                                                      50)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 0, 15, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, -0.7),
                                                            child:
                                                                CircularPercentIndicator(
                                                              percent: detailsScreenDatabaseRecipesRecord!
                                                                      .recipeHealthScore!
                                                                      .toDouble() /
                                                                  100.0,
                                                              radius: 60,
                                                              lineWidth: 15,
                                                              animation: true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                              center: Text(
                                                                '${detailsScreenDatabaseRecipesRecord!.recipeHealthScore?.toString()} %',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.healthScoreFactor(
                                                                        detailsScreenDatabaseRecipesRecord!
                                                                            .recipeHealthScore
                                                                            ?.toDouble(),
                                                                        100.0),
                                                                    'Not Measured',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            50,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Health Score',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 12),
                                                      child: Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 530,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 12,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              spreadRadius: 5,
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 12),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            16,
                                                                            16,
                                                                            12),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Nutrient Content',
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 4,
                                                                thickness: 1,
                                                                indent: 0,
                                                                endIndent: 0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0,
                                                                        0.07),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final nutrition = detailsScreenDatabaseRecipesRecord!
                                                                        .nutrientName!
                                                                        .toList()
                                                                        .take(5)
                                                                        .toList();
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          nutrition
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              nutritionIndex) {
                                                                        final nutritionItem =
                                                                            nutrition[nutritionIndex];
                                                                        return Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              44,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15,
                                                                                0,
                                                                                15,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  nutritionItem,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  '${detailsScreenDatabaseRecipesRecord!.nutrientAmount!.toList()[nutritionIndex].toString()}  ${detailsScreenDatabaseRecipesRecord!.nutrientUnit!.toList()[nutritionIndex]}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            0,
                                                                            24,
                                                                            12),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              12,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'RecipeNutrientContentPageDatabase',
                                                                            queryParams:
                                                                                {
                                                                              'id': serializeParam(
                                                                                widget.recipeId,
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text:
                                                                            'See More',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              44,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20,
                                                                              0,
                                                                              20,
                                                                              0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: Colors.white,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                              ),
                                                                          elevation:
                                                                              2,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40),
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Stack(
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: StreamBuilder<
                                                      List<RecipeNotesRecord>>(
                                                    stream:
                                                        queryRecipeNotesRecord(
                                                      parent:
                                                          detailsScreenDatabaseRecipesRecord!
                                                              .reference,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 150,
                                                            height: 150,
                                                            child: SpinKitPulse(
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              size: 150,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RecipeNotesRecord>
                                                          listViewRecipeNotesRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewRecipeNotesRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewRecipeNotesRecord =
                                                              listViewRecipeNotesRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 70,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              60),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewRecipeNotesRecord
                                                                              .recipeNoteGiverImage,
                                                                          'https://picsum.photos/seed/514/600',
                                                                        ),
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                8),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  listViewRecipeNotesRecord.recipeNoteGiver!,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    dateTimeFormat('relative', listViewRecipeNotesRecord.dateCreated!),
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                10,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      AutoSizeText(
                                                                                        listViewRecipeNotesRecord.recipeNotes!,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: StreamBuilder<
                                                List<UserFavoriteRecord>>(
                                              stream: queryUserFavoriteRecord(
                                                queryBuilder:
                                                    (userFavoriteRecord) =>
                                                        userFavoriteRecord.where(
                                                            'userId',
                                                            isEqualTo:
                                                                currentUserUid),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 150,
                                                      height: 150,
                                                      child: SpinKitPulse(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                        size: 150,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UserFavoriteRecord>
                                                    unTappedUserFavoriteRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final unTappedUserFavoriteRecord =
                                                    unTappedUserFavoriteRecordList
                                                            .isNotEmpty
                                                        ? unTappedUserFavoriteRecordList
                                                            .first
                                                        : null;
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return Padding(
                                                          padding: MediaQuery.of(
                                                                  bottomSheetContext)
                                                              .viewInsets,
                                                          child:
                                                              CreateNoteWidget(
                                                            userName:
                                                                currentUserDisplayName,
                                                            userImage:
                                                                currentUserPhoto,
                                                            recipeRef:
                                                                detailsScreenDatabaseRecipesRecord!
                                                                    .reference,
                                                            userFavRef:
                                                                unTappedUserFavoriteRecord!,
                                                            recipeId: widget
                                                                .recipeId!,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(16),
                                                        topRight:
                                                            Radius.circular(16),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.network(
                                                                'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                                                width: 40,
                                                                height: 40,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            12,
                                                                            12,
                                                                            12),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .shortBioController1,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.shortBioController1',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(bottomSheetContext).viewInsets,
                                                                            child:
                                                                                CreateNoteWidget(
                                                                              userName: currentUserDisplayName,
                                                                              userImage: currentUserPhoto,
                                                                              recipeRef: detailsScreenDatabaseRecipesRecord!.reference,
                                                                              userFavRef: unTappedUserFavoriteRecord!,
                                                                              recipeId: widget.recipeId!,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText:
                                                                        'Enter your note here...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE0E3E7),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFF4B39EF),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFFF5963),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFFF5963),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            32,
                                                                            20,
                                                                            12),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Color(
                                                                            0xFF14181B),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .multiline,
                                                                  validator: _model
                                                                      .shortBioController1Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color: Color(
                                                                  0xFFC0C0C0),
                                                              size: 32,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) =>
                                          FutureBuilder<ApiCallResponse>(
                                        future: SimilarRecipesCall.call(
                                          id: widget.recipeId,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 150,
                                                height: 150,
                                                child: SpinKitPulse(
                                                  color: Color(0xFF4B39EF),
                                                  size: 150,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnSimilarRecipesResponse =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<
                                                        UserNutrientContentRecord>>(
                                                  stream:
                                                      queryUserNutrientContentRecord(
                                                    parent:
                                                        currentUserReference,
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 150,
                                                          height: 150,
                                                          child: SpinKitPulse(
                                                            color: Color(
                                                                0xFF4B39EF),
                                                            size: 150,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UserNutrientContentRecord>
                                                        containerUserNutrientContentRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerUserNutrientContentRecord =
                                                        containerUserNutrientContentRecordList
                                                                .isNotEmpty
                                                            ? containerUserNutrientContentRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 475,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 12.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: RecipeInfoCall.call(
                                                      ids: functions
                                                          .integerListJoiner(
                                                              (SimilarRecipesCall
                                                                      .id(
                                                        columnSimilarRecipesResponse
                                                            .jsonBody,
                                                      )?.toList() as List<
                                                                      dynamic>?)
                                                                  ?.map<int>(
                                                                      (item) => item
                                                                          as int)
                                                                  .toList()),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 150.0,
                                                            height: 150.0,
                                                            child: SpinKitPulse(
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              size: 150.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final wrapRecipeInfoResponse =
                                                          snapshot.data!;
                                                      
                                                      return Builder(
                                                        builder: (context) {
                                                          final recipes =
                                                              wrapRecipeInfoResponse
                                                                  .jsonBody
                                                                  .toList();
                                                          return Wrap(
                                                            spacing: 8.0,
                                                            runSpacing: 8.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: List.generate(
                                                                recipes.length,
                                                                (recipesIndex) {
                                                              final recipesItem =
                                                                  recipes[
                                                                      recipesIndex];
                                                              return StreamBuilder<
                                                                  List<
                                                                      RecipeListRecord>>(
                                                                stream:
                                                                    queryRecipeListRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            150.0,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              Color(0xFF4B39EF),
                                                                          size:
                                                                              150.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<RecipeListRecord>
                                                                      containerRecipeListRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (containerRecipeListRecordList
                                                                          .first
                                                                          .listOfRecipes!
                                                                          .toList()
                                                                          .contains(
                                                                              getJsonField(
                                                                            recipesItem,
                                                                            r'''$.id''',
                                                                          ))) {
                                                                        context
                                                                            .pushNamed(
                                                                          'DetailsScreenDatabase',
                                                                          queryParams:
                                                                              {
                                                                            'recipeId':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                recipesItem,
                                                                                r'''$.id''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        final recipeListUpdateData =
                                                                            {
                                                                          'list_of_recipes':
                                                                              FieldValue.arrayUnion([
                                                                            getJsonField(
                                                                              recipesItem,
                                                                              r'''$.id''',
                                                                            )
                                                                          ]),
                                                                        };
                                                                        await containerRecipeListRecordList
                                                                            .first
                                                                            .reference
                                                                            .update(recipeListUpdateData);

                                                                        context
                                                                            .pushNamed(
                                                                          'recipeAdder',
                                                                          queryParams:
                                                                              {
                                                                            'id':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                recipesItem,
                                                                                r'''$.id''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.45,
                                                                      height:
                                                                          190.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x230E151B),
                                                                            offset:
                                                                                Offset(0.0, 2.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                  recipesItem,
                                                                                  r'''$.image''',
                                                                                ),
                                                                                width: double.infinity,
                                                                                height: 115.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    recipesItem,
                                                                                    r'''$.title''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0xFF14181B),
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                      ),
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
                                                            }),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Stack(
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: StreamBuilder<
                                                      List<
                                                          RecipeUserNotesRecord>>(
                                                    stream:
                                                        queryRecipeUserNotesRecord(
                                                      parent:
                                                          currentUserReference,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 150,
                                                            height: 150,
                                                            child: SpinKitPulse(
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              size: 150,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<RecipeUserNotesRecord>
                                                          listViewRecipeUserNotesRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewRecipeUserNotesRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewRecipeUserNotesRecord =
                                                              listViewRecipeUserNotesRecordList[
                                                                  listViewIndex];
                                                          return Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 70,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              60),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewRecipeUserNotesRecord
                                                                              .recipeNoteGiverImage,
                                                                          'https://picsum.photos/seed/514/600',
                                                                        ),
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                8),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  listViewRecipeUserNotesRecord.recipeNoteGiver!,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    dateTimeFormat('relative', listViewRecipeUserNotesRecord.dateCreated!),
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                10,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      AutoSizeText(
                                                                                        listViewRecipeUserNotesRecord.recipeNotes!,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: StreamBuilder<
                                                List<UserFavoriteRecord>>(
                                              stream: queryUserFavoriteRecord(
                                                queryBuilder:
                                                    (userFavoriteRecord) =>
                                                        userFavoriteRecord.where(
                                                            'userId',
                                                            isEqualTo:
                                                                currentUserUid),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 150,
                                                      height: 150,
                                                      child: SpinKitPulse(
                                                        color:
                                                            Color(0xFF4B39EF),
                                                        size: 150,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UserFavoriteRecord>
                                                    unTappedUserFavoriteRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final unTappedUserFavoriteRecord =
                                                    unTappedUserFavoriteRecordList
                                                            .isNotEmpty
                                                        ? unTappedUserFavoriteRecordList
                                                            .first
                                                        : null;
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return Padding(
                                                          padding: MediaQuery.of(
                                                                  bottomSheetContext)
                                                              .viewInsets,
                                                          child:
                                                              CreateNoteWidget(
                                                            userName:
                                                                currentUserDisplayName,
                                                            userImage:
                                                                currentUserPhoto,
                                                            recipeRef:
                                                                detailsScreenDatabaseRecipesRecord!
                                                                    .reference,
                                                            userFavRef:
                                                                unTappedUserFavoriteRecord!,
                                                            recipeId: widget
                                                                .recipeId!,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(16),
                                                        topRight:
                                                            Radius.circular(16),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.network(
                                                                'https://images.unsplash.com/photo-1610737241336-371badac3b66?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                                                width: 40,
                                                                height: 40,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            12,
                                                                            12,
                                                                            12),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .shortBioController2,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.shortBioController2',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(bottomSheetContext).viewInsets,
                                                                            child:
                                                                                CreateNoteWidget(
                                                                              userName: currentUserDisplayName,
                                                                              userImage: currentUserPhoto,
                                                                              recipeRef: detailsScreenDatabaseRecipesRecord!.reference,
                                                                              userFavRef: unTappedUserFavoriteRecord!,
                                                                              recipeId: widget.recipeId!,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    hintText:
                                                                        'Enter your note here...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFE0E3E7),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFF4B39EF),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFFF5963),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFFF5963),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            32,
                                                                            20,
                                                                            12),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Color(
                                                                            0xFF14181B),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .multiline,
                                                                  validator: _model
                                                                      .shortBioController2Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color: Color(
                                                                  0xFFC0C0C0),
                                                              size: 32,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

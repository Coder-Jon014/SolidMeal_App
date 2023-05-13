import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'details_screen_model.dart';
export 'details_screen_model.dart';

class DetailsScreenWidget extends StatefulWidget {
  const DetailsScreenWidget({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  final int? recipeId;

  @override
  _DetailsScreenWidgetState createState() => _DetailsScreenWidgetState();
}

class _DetailsScreenWidgetState extends State<DetailsScreenWidget> {
  late DetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: RecipeInfoCall.call(
        ids: widget.recipeId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 150.0,
              height: 150.0,
              child: SpinKitPulse(
                color: Color(0xFF4B39EF),
                size: 150.0,
              ),
            ),
          );
        }
        final detailsScreenRecipeInfoResponse = snapshot.data!;
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
                              height: 240.0,
                              child: Stack(
                                alignment: AlignmentDirectional(-0.95, -0.7),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Image.network(
                                      RecipeInfoCall.image(
                                        detailsScreenRecipeInfoResponse
                                            .jsonBody,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 240.0,
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
                                            RecipeInfoCall.url(
                                              detailsScreenRecipeInfoResponse
                                                  .jsonBody,
                                            ).toString(),
                                            sharePositionOrigin:
                                                getWidgetBoundingBox(context),
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF5F5F5),
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Icon(
                                              Icons.ios_share,
                                              color: Colors.black,
                                              size: 24.0,
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
                                        context.pop();
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Icon(
                                            Icons.arrow_back_rounded,
                                            color: Colors.black,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<RecipeListRecord>>(
                                stream: queryRecipeListRecord(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 150.0,
                                        height: 150.0,
                                        child: SpinKitPulse(
                                          color: Color(0xFF4B39EF),
                                          size: 150.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<RecipeListRecord>
                                      stackRecipeListRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final stackRecipeListRecord =
                                      stackRecipeListRecordList.isNotEmpty
                                          ? stackRecipeListRecordList.first
                                          : null;
                                  return Container(
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Recipe',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                90.0, 0.0),
                                                    child: AutoSizeText(
                                                      RecipeInfoCall.title(
                                                        detailsScreenRecipeInfoResponse
                                                            .jsonBody,
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                fontSize: 22.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.91, -1.35),
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
                                                    width: 150.0,
                                                    height: 150.0,
                                                    child: SpinKitPulse(
                                                      color: Color(0xFF4B39EF),
                                                      size: 150.0,
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
                                                          ? FieldValue
                                                              .arrayRemove([
                                                              recipeIdElement
                                                            ])
                                                          : FieldValue
                                                              .arrayUnion([
                                                              recipeIdElement
                                                            ]);
                                                  final userFavoriteUpdateData =
                                                      {
                                                    'recipeId': recipeIdUpdate,
                                                  };
                                                  await toggleIconUserFavoriteRecord!
                                                      .reference
                                                      .update(
                                                          userFavoriteUpdateData);
                                                  if (toggleIconUserFavoriteRecord!
                                                      .recipeId!
                                                      .toList()
                                                      .contains(
                                                          widget.recipeId)) {
                                                    final userFavoriteUpdateData1 =
                                                        {
                                                      'recipeId': FieldValue
                                                          .arrayRemove([
                                                        widget.recipeId
                                                      ]),
                                                    };
                                                    await toggleIconUserFavoriteRecord!
                                                        .reference
                                                        .update(
                                                            userFavoriteUpdateData1);
                                                  } else {
                                                    if (stackRecipeListRecord!
                                                        .listOfRecipes!
                                                        .toList()
                                                        .contains(
                                                            widget.recipeId)) {
                                                      final userFavoriteUpdateData2 =
                                                          {
                                                        'recipeId': FieldValue
                                                            .arrayUnion([
                                                          widget.recipeId
                                                        ]),
                                                      };
                                                      await toggleIconUserFavoriteRecord!
                                                          .reference
                                                          .update(
                                                              userFavoriteUpdateData2);
                                                    } else {
                                                      final recipeListUpdateData =
                                                          {
                                                        'list_of_recipes':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.recipeId
                                                        ]),
                                                      };
                                                      await stackRecipeListRecord!
                                                          .reference
                                                          .update(
                                                              recipeListUpdateData);

                                                      final userFavoriteUpdateData3 =
                                                          {
                                                        'recipeId': FieldValue
                                                            .arrayUnion([
                                                          widget.recipeId
                                                        ]),
                                                      };
                                                      await toggleIconUserFavoriteRecord!
                                                          .reference
                                                          .update(
                                                              userFavoriteUpdateData3);

                                                      final recipesCreateData =
                                                          {
                                                        ...createRecipesRecordData(
                                                          recipeId:
                                                              widget.recipeId,
                                                          recipeTitle:
                                                              RecipeInfoCall
                                                                  .title(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ).toString(),
                                                          recipeImage:
                                                              RecipeInfoCall
                                                                  .image(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ),
                                                          recipeHealthScore:
                                                              RecipeInfoCall
                                                                  .healthscore(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ),
                                                          servings:
                                                              RecipeInfoCall
                                                                  .servings(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ).toDouble(),
                                                          readyInMinutes:
                                                              RecipeInfoCall
                                                                  .readyInMinutes(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ).toDouble(),
                                                        ),
                                                        'recipe_instructiona':
                                                            (RecipeInfoCall
                                                                    .instructions(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList(),
                                                        'recipe_ingredients':
                                                            (RecipeInfoCall
                                                                    .ingredientName(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList(),
                                                        'recipe_ingredient_unit':
                                                            (RecipeInfoCall
                                                                    .ingredientUnit(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList(),
                                                        'nutrientAmount':
                                                            RecipeInfoCall
                                                                .nutritionAmount(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ),
                                                        'nutrientUnit':
                                                            (RecipeInfoCall
                                                                    .nutrtionUnit(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList(),
                                                        'nutrientName': (RecipeInfoCall
                                                                .nutritionName(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList(),
                                                        'nutrientPercentofDailyNeeds':
                                                            RecipeInfoCall
                                                                .percentofDailyNeeds(
                                                          detailsScreenRecipeInfoResponse
                                                              .jsonBody,
                                                        ),
                                                      };
                                                      await RecipesRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              recipesCreateData);
                                                    }
                                                  }
                                                },
                                                value:
                                                    toggleIconUserFavoriteRecord!
                                                        .recipeId!
                                                        .toList()
                                                        .contains(
                                                            widget.recipeId),
                                                onIcon: Icon(
                                                  Icons.favorite,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.black,
                                                  size: 40.0,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.black,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  tabs: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 1.0, 1.0, 1.0),
                                          child: Icon(
                                            Icons.fastfood_sharp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Ingredients',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 1.0, 1.0, 1.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.bookOpen,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Instructions',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 1.0, 1.0, 1.0),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Tab(
                                          text: 'Health',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final ingredients =
                                                      (RecipeInfoCall
                                                                  .ingredientName(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
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
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons.food_bank,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${ingredientsItem}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
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
                                                                        0.0),
                                                                child: Text(
                                                                  '${(RecipeInfoCall.ingredientAmount(
                                                                    detailsScreenRecipeInfoResponse
                                                                        .jsonBody,
                                                                  ) as List).map<String>((s) => s.toString()).toList()[ingredientsIndex].toString()} ${(RecipeInfoCall.ingredientUnit(
                                                                    detailsScreenRecipeInfoResponse
                                                                        .jsonBody,
                                                                  ) as List).map<String>((s) => s.toString()).toList()[ingredientsIndex]}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
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
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 10.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final instructions =
                                                      (RecipeInfoCall
                                                                  .instructions(
                                                            detailsScreenRecipeInfoResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
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
                                                            size: 24.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                '${instructionsItem}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
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
                                                if (RecipeInfoCall.healthscore(
                                                      detailsScreenRecipeInfoResponse
                                                          .jsonBody,
                                                    ) >
                                                    50)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -0.7),
                                                          child:
                                                              CircularPercentIndicator(
                                                            percent: RecipeInfoCall
                                                                    .healthscore(
                                                                  detailsScreenRecipeInfoResponse
                                                                      .jsonBody,
                                                                ).toDouble() /
                                                                100.0,
                                                            radius: 60.0,
                                                            lineWidth: 15.0,
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
                                                              '${RecipeInfoCall.healthscore(
                                                                detailsScreenRecipeInfoResponse
                                                                    .jsonBody,
                                                              ).toString()} %',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                      30.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.healthScoreFactor(
                                                                      RecipeInfoCall.healthscore(
                                                                        detailsScreenRecipeInfoResponse
                                                                            .jsonBody,
                                                                      ).toDouble(),
                                                                      100.0),
                                                                  'Not Measured',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          50.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
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
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 530.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          12.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Nutrient Content',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
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
                                                              height: 4.0,
                                                              thickness: 1.0,
                                                              indent: 0.0,
                                                              endIndent: 0.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      0.07),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final nutrition = ((RecipeInfoCall.nutritionName(
                                                                            detailsScreenRecipeInfoResponse.jsonBody,
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()
                                                                              ?.toList() ??
                                                                          [])
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
                                                                          nutrition[
                                                                              nutritionIndex];
                                                                      return Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            44.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                nutritionItem,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '${(RecipeInfoCall.nutritionAmount(
                                                                                  detailsScreenRecipeInfoResponse.jsonBody,
                                                                                ) as List).map<String>((s) => s.toString()).toList()[nutritionIndex].toString()}  ${(RecipeInfoCall.nutrtionUnit(
                                                                                  detailsScreenRecipeInfoResponse.jsonBody,
                                                                                ) as List).map<String>((s) => s.toString()).toList()[nutritionIndex]}',
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
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          12.0),
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
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'RecipeNutrientContentPage',
                                                                          queryParams:
                                                                              {
                                                                            'id':
                                                                                serializeParam(
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
                                                                            44.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: Colors.white,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
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

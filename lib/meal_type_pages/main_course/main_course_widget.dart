import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main_course_model.dart';
export 'main_course_model.dart';

class MainCourseWidget extends StatefulWidget {
  const MainCourseWidget({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  final String? type;
  final String? title;

  @override
  _MainCourseWidgetState createState() => _MainCourseWidgetState();
}

class _MainCourseWidgetState extends State<MainCourseWidget> {
  late MainCourseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainCourseModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().queryMainCourse,
      'chicken',
    ));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserNutrientContentRecord>>(
      stream: queryUserNutrientContentRecord(
        parent: currentUserReference,
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
        List<UserNutrientContentRecord>
            mainCourseUserNutrientContentRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final mainCourseUserNutrientContentRecord =
            mainCourseUserNutrientContentRecordList.isNotEmpty
                ? mainCourseUserNutrientContentRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                '${widget.title} Options',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            ),
            body: StreamBuilder<List<IntoleranceListRecord>>(
              stream: queryIntoleranceListRecord(
                queryBuilder: (intoleranceListRecord) =>
                    intoleranceListRecord.whereIn(
                        'intolerance',
                        mainCourseUserNutrientContentRecord!.intolerances!
                            .toList()),
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
                List<IntoleranceListRecord> containerIntoleranceListRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerIntoleranceListRecord =
                    containerIntoleranceListRecordList.isNotEmpty
                        ? containerIntoleranceListRecordList.first
                        : null;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<UserNutrientContentRecord>>(
                    stream: queryUserNutrientContentRecord(
                      parent: currentUserReference,
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
                      List<UserNutrientContentRecord>
                          columnUserNutrientContentRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnUserNutrientContentRecord =
                          columnUserNutrientContentRecordList.isNotEmpty
                              ? columnUserNutrientContentRecordList.first
                              : null;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 1000),
                                  () async {
                                    setState(() {
                                      FFAppState().queryMainCourse =
                                          valueOrDefault<String>(
                                        _model.textController.text,
                                        'chicken',
                                      );
                                    });
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Search products...',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDADADA),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: Color(0xFF57636C),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                maxLines: null,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[a-zA-Z]'))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: FutureBuilder<ApiCallResponse>(
                                future: RecipesCall.call(
                                  query: valueOrDefault<String>(
                                    FFAppState().queryMainCourse,
                                    'chicken',
                                  ),
                                  number: 20,
                                  type: widget.type,
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
                                  final wrapRecipesResponse = snapshot.data!;
                                  final recipesJson = wrapRecipesResponse
                                      .jsonBody; // get the JSON body of the response
                                  // Convert the JSON to a list of maps (recipes)
                                  final recipes = recipesJson['results']
                                      .cast<Map<String, dynamic>>();

                                  // call the knn algorithm integrator on the recipes
                                  final knnRecipes =
                                      functions.knnAlgorithmIntegrator(
                                    columnUserNutrientContentRecord!.maxCarbs!,
                                    columnUserNutrientContentRecord!.maxProtein!,
                                    columnUserNutrientContentRecord!.maxCalories!,
                                    columnUserNutrientContentRecord!.maxFat!,
                                    columnUserNutrientContentRecord!.maxCalcium!,
                                    columnUserNutrientContentRecord!
                                        .maxCholesterol!,
                                    columnUserNutrientContentRecord!
                                        .maxSaturatedFat!,
                                    columnUserNutrientContentRecord!
                                        .maxPotassium!,
                                    columnUserNutrientContentRecord!.maxSugar!,
                                    columnUserNutrientContentRecord!.maxSodium!,
                                    columnUserNutrientContentRecord!.maxFiber!,
                                    columnUserNutrientContentRecord!
                                        .maxMagnesium!,
                                    recipes,
                                    columnUserNutrientContentRecord!.intolerancesKeyWords!.toList(),
                                  );
                                  return Builder(
                                    builder: (context) {
                                      final recipes = knnRecipes;
                                      return Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(recipes.length,
                                            (recipesIndex) {
                                          final recipesItem =
                                              recipes[recipesIndex];
                                          return StreamBuilder<
                                              List<RecipeListRecord>>(
                                            stream: queryRecipeListRecord(),
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
                                              List<RecipeListRecord>
                                                  containerRecipeListRecordList =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (containerRecipeListRecordList
                                                      .first.listOfRecipes!
                                                      .toList()
                                                      .contains(getJsonField(
                                                        recipesItem,
                                                        r'''$.id''',
                                                      ))) {
                                                    context.pushNamed(
                                                      'DetailsScreenDatabase',
                                                      queryParams: {
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
                                                          FieldValue
                                                              .arrayUnion([
                                                        getJsonField(
                                                          recipesItem,
                                                          r'''$.id''',
                                                        )
                                                      ]),
                                                    };
                                                    await containerRecipeListRecordList
                                                        .first.reference
                                                        .update(
                                                            recipeListUpdateData);

                                                    context.pushNamed(
                                                      'recipeAdder',
                                                      queryParams: {
                                                        'id': serializeParam(
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
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.45,
                                                  height: 190,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x230E151B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 4, 4, 4),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            getJsonField(
                                                              recipesItem,
                                                              r'''$.image''',
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height: 115,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        12,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              getJsonField(
                                                                recipesItem,
                                                                r'''$.title''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
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
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

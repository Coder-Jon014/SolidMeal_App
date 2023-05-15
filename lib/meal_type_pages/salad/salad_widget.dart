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
import 'salad_model.dart';
export 'salad_model.dart';

class SaladWidget extends StatefulWidget {
  const SaladWidget({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  final String? type;
  final String? title;

  @override
  _SaladWidgetState createState() => _SaladWidgetState();
}

class _SaladWidgetState extends State<SaladWidget> {
  late SaladModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaladModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().querySalad,
      'salad',
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
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
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
                  fontSize: 28.0,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: StreamBuilder<List<UserNutrientContentRecord>>(
          stream: queryUserNutrientContentRecord(
            parent: currentUserReference,
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
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 1000),
                        () async {
                          setState(() {
                            FFAppState().querySalad = valueOrDefault<String>(
                              _model.textController.text,
                              'salad',
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
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDADADA),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xFF57636C),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF14181B),
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      maxLines: null,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: RecipesCall.call(
                        maxSaturatedFat:
                            columnUserNutrientContentRecord!.maxSaturatedFat,
                        maxSugar: columnUserNutrientContentRecord!.maxSugar,
                        maxSodium: columnUserNutrientContentRecord!.maxSodium,
                        query: valueOrDefault<String>(
                          FFAppState().querySalad,
                          'salad',
                        ),
                        number: 20,
                        intolerances: functions.stringListJoiner(
                            columnUserNutrientContentRecord!.intolerances!
                                .toList()),
                        maxPotassium:
                            columnUserNutrientContentRecord!.maxPotassium,
                        maxCarbs: columnUserNutrientContentRecord!.maxCarbs,
                        maxProtein: columnUserNutrientContentRecord!.maxProtein,
                        maxFat: columnUserNutrientContentRecord!.maxFat,
                        maxCalcium: columnUserNutrientContentRecord!.maxCalcium,
                        maxCholesterol:
                            columnUserNutrientContentRecord!.maxCholesterol,
                        maxFiber: columnUserNutrientContentRecord!.maxFiber,
                        maxCalories:
                            columnUserNutrientContentRecord!.maxCalories,
                        maxMagnesium:
                            columnUserNutrientContentRecord!.maxMagnesium,
                        offset: 1,
                        type: widget.type,
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
                        final wrapRecipesResponse = snapshot.data!;
                       final recipesJson = wrapRecipesResponse
                                .jsonBody; // get the JSON body of the response
                            // Convert the JSON to a list of maps (recipes)
                            List<Map<String, dynamic>> recipes =
                                List<Map<String, dynamic>>.from(
                                    recipesJson["results"]);

                            // Apply your custom function to the recipes
                            recipes = functions.knnAlgorithmIntegrator(
                                columnUserNutrientContentRecord!.maxCarbs ?? 100,
                                columnUserNutrientContentRecord!.maxProtein ??
                                    100,
                                columnUserNutrientContentRecord!.maxCalories ??
                                    2000,
                                columnUserNutrientContentRecord!.maxFat ?? 100,
                                columnUserNutrientContentRecord!.maxCalcium ??
                                    100,
                                columnUserNutrientContentRecord!.maxCholesterol ??
                                    100,
                                columnUserNutrientContentRecord!
                                        .maxSaturatedFat ??
                                    100,
                                columnUserNutrientContentRecord!.maxPotassium ??
                                    100,
                                columnUserNutrientContentRecord!.maxSugar ?? 100,
                                columnUserNutrientContentRecord!.maxSodium ?? 100,
                                columnUserNutrientContentRecord!.maxFiber ?? 100,
                                columnUserNutrientContentRecord!.maxMagnesium ??
                                    100,
                                recipes);

                            // Convert the list of recipes back to JSON
                            Map<String, dynamic> newRecipesJson = {
                              "results": recipes
                            };

                            return Builder(
                              builder: (context) {
                                final recipes =
                                    newRecipesJson['results'] as List<dynamic>;
                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children:
                                  List.generate(recipes.length, (recipesIndex) {
                                final recipesItem = recipes[recipesIndex];
                                return StreamBuilder<List<RecipeListRecord>>(
                                  stream: queryRecipeListRecord(),
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
                                        containerRecipeListRecordList =
                                        snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
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
                                              'recipeId': serializeParam(
                                                getJsonField(
                                                  recipesItem,
                                                  r'''$.id''',
                                                ),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          final recipeListUpdateData = {
                                            'list_of_recipes':
                                                FieldValue.arrayUnion([
                                              getJsonField(
                                                recipesItem,
                                                r'''$.id''',
                                              )
                                            ]),
                                          };
                                          await containerRecipeListRecordList
                                              .first.reference
                                              .update(recipeListUpdateData);

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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height: 190.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x230E151B),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 4.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      recipesItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
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
      ),
    );
  }
}

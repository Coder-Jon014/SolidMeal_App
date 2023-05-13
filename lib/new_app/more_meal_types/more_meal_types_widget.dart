import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'more_meal_types_model.dart';
export 'more_meal_types_model.dart';

class MoreMealTypesWidget extends StatefulWidget {
  const MoreMealTypesWidget({
    Key? key,
    required this.type,
    required this.title,
    required this.query,
  }) : super(key: key);

  final String? type;
  final String? title;
  final String? query;

  @override
  _MoreMealTypesWidgetState createState() => _MoreMealTypesWidgetState();
}

class _MoreMealTypesWidgetState extends State<MoreMealTypesWidget> {
  late MoreMealTypesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreMealTypesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.queryVariable3 = widget.query;
      });
    });

    _model.textController ??=
        TextEditingController(text: _model.queryVariable3);
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<IllnessesRecord>>(
        stream: queryIllnessesRecord(
          queryBuilder: (illnessesRecord) => illnessesRecord.where('illness',
              isEqualTo: valueOrDefault(currentUserDocument?.userIllness, '')),
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
          List<IllnessesRecord> moreMealTypesIllnessesRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final moreMealTypesIllnessesRecord =
              moreMealTypesIllnessesRecordList.isNotEmpty
                  ? moreMealTypesIllnessesRecordList.first
                  : null;
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFF1F4F8),
              appBar: AppBar(
                backgroundColor: Colors.black,
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
                                  _model.queryVariable3 =
                                      _model.textController.text;
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
                                  color: Color(0x00000000),
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
                                      .containsKey(FlutterFlowTheme.of(context)
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: FutureBuilder<ApiCallResponse>(
                            future: RecipesCall.call(
                              maxSaturatedFat: columnUserNutrientContentRecord!
                                  .maxSaturatedFat,
                              maxSugar:
                                  columnUserNutrientContentRecord!.maxSugar,
                              maxSodium:
                                  columnUserNutrientContentRecord!.maxSodium,
                              query: _model.queryVariable3,
                              number: 20,
                              intolerances: functions.stringListJoiner(
                                  columnUserNutrientContentRecord!.intolerances!
                                      .toList()),
                              maxPotassium:
                                  columnUserNutrientContentRecord!.maxPotassium,
                              maxCarbs:
                                  columnUserNutrientContentRecord!.maxCarbs,
                              maxProtein:
                                  columnUserNutrientContentRecord!.maxProtein,
                              maxFat: columnUserNutrientContentRecord!.maxFat,
                              maxCalcium:
                                  columnUserNutrientContentRecord!.maxCalcium,
                              maxCholesterol: columnUserNutrientContentRecord!
                                  .maxCholesterol,
                              maxFiber:
                                  columnUserNutrientContentRecord!.maxFiber,
                              maxCalories:
                                  columnUserNutrientContentRecord!.maxCalories,
                              maxMagnesium:
                                  columnUserNutrientContentRecord!.maxMagnesium,
                              offset: 5,
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
                              List<Map<String, dynamic>> recipes =
                                  List<Map<String, dynamic>>.from(
                                      recipesJson["results"]);

                              // Apply your custom function to the recipes
                              recipes = functions.knnAlgorithmIntegrator(
                                  columnUserNutrientContentRecord!.maxCarbs ??
                                      100,
                                  columnUserNutrientContentRecord!.maxProtein ??
                                      100,
                                  columnUserNutrientContentRecord!.maxCalories ??
                                      2000,
                                  columnUserNutrientContentRecord!.maxFat ??
                                      100,
                                  columnUserNutrientContentRecord!.maxCalcium ??
                                      100,
                                  columnUserNutrientContentRecord!.maxCholesterol ??
                                      100,
                                  columnUserNutrientContentRecord!.maxSaturatedFat ??
                                      100,
                                  columnUserNutrientContentRecord!
                                          .maxPotassium ??
                                      100,
                                  columnUserNutrientContentRecord!.maxSugar ??
                                      100,
                                  columnUserNutrientContentRecord!.maxSodium ??
                                      100,
                                  columnUserNutrientContentRecord!.maxFiber ??
                                      100,
                                  columnUserNutrientContentRecord!
                                          .maxMagnesium ??
                                      100,
                                  recipes);

                              // Convert the list of recipes back to JSON
                              Map<String, dynamic> newRecipesJson = {
                                "results": recipes
                              };

                              return Builder(
                                builder: (context) {
                                  final recipes = newRecipesJson['results']
                                      as List<dynamic>;
                                  return Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(recipes.length,
                                        (recipesIndex) {
                                      final recipesItem = recipes[recipesIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'DetailsScreen',
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
                                                color: Color(0x230E151B),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    getJsonField(
                                                      recipesItem,
                                                      r'''$.image''',
                                                    ),
                                                    width: double.infinity,
                                                    height: 115,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 12, 0, 0),
                                                    child: Text(
                                                      getJsonField(
                                                        recipesItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF14181B),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 4, 0, 0),
                                                    child: Text(
                                                      '${getJsonField(
                                                        recipesItem,
                                                        r'''$.nutrition.nutrients[0].amount''',
                                                      ).toString()} kCal',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
        },
      ),
    );
  }
}

import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPicksSection extends StatelessWidget {
  final String? query;
  final UserNutrientContentRecord nutrientContent;
  final UserFavoriteRecord favoriteRecord;

  const TopPicksSection({
    Key? key,
    required this.query,
    required this.nutrientContent,
    required this.favoriteRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
      child: FutureBuilder<ApiCallResponse>(
        future: RecipesCall.call(
          query: query,
          number: 30,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: SpinKitPulse(
                  color: const Color(0xFF4B39EF),
                  size: 150,
                ),
              ),
            );
          }
          final wrapRecipesResponse = snapshot.data!;
          final recipesJson = wrapRecipesResponse.jsonBody;
          final recipes =
              recipesJson['results'].cast<Map<String, dynamic>>();
          final knnRecipes = functions.knnAlgorithmIntegrator(
            nutrientContent.maxCarbs!,
            nutrientContent.maxProtein!,
            nutrientContent.maxCalories!,
            nutrientContent.maxFat!,
            nutrientContent.maxCalcium!,
            nutrientContent.maxCholesterol!,
            nutrientContent.maxSaturatedFat!,
            nutrientContent.maxPotassium!,
            nutrientContent.maxSugar!,
            nutrientContent.maxSodium!,
            nutrientContent.maxFiber!,
            nutrientContent.maxMagnesium!,
            recipes,
            nutrientContent.intolerancesKeyWords!.toList(),
          );

          return Builder(
            builder: (context) {
              return Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.vertical,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: List.generate(knnRecipes.length, (recipeIndex) {
                  final recipeItem = knnRecipes[recipeIndex];
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: StreamBuilder<List<RecipeListRecord>>(
                      stream: queryRecipeListRecord(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: SpinKitPulse(
                                color: const Color(0xFF4B39EF),
                                size: 150,
                              ),
                            ),
                          );
                        }
                        List<RecipeListRecord> containerRecipeListRecordList =
                            snapshot.data!;
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (containerRecipeListRecordList
                                .first
                                .listOfRecipes!
                                .toList()
                                .contains(getJsonField(
                                  recipeItem,
                                  r'''$.id''',
                                ))) {
                              context.pushNamed(
                                'DetailsScreenDatabase',
                                queryParams: {
                                  'recipeId': serializeParam(
                                    getJsonField(
                                      recipeItem,
                                      r'''$.id''',
                                    ),
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              final recipeListUpdateData = {
                                'list_of_recipes': FieldValue.arrayUnion([
                                  getJsonField(
                                    recipeItem,
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
                                      recipeItem,
                                      r'''$.id''',
                                    ),
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.89,
                            height: 236,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      getJsonField(
                                        recipeItem,
                                        r'''$.image''',
                                      ),
                                      width: double.infinity,
                                      height: 155,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(-0.99, -1.29),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                recipeItem,
                                                r'''$.title''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: const Color(0xFF14181B),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.normal,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap().containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .titleMediumFamily),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.94, -0.8),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            final recipeIdElement = getJsonField(
                                              recipeItem,
                                              r'''$.id''',
                                            );
                                            final recipeIdUpdate =
                                                favoriteRecord.recipeId!
                                                        .toList()
                                                        .contains(recipeIdElement)
                                                    ? FieldValue.arrayRemove([
                                                        recipeIdElement
                                                      ])
                                                    : FieldValue.arrayUnion([
                                                        recipeIdElement
                                                      ]);
                                            final userFavoriteUpdateData = {
                                              'recipeId': recipeIdUpdate,
                                            };
                                            await favoriteRecord.reference
                                                .update(userFavoriteUpdateData);
                                          },
                                          value: favoriteRecord.recipeId!
                                              .toList()
                                              .contains(getJsonField(
                                                recipeItem,
                                                r'''$.id''',
                                              )),
                                          onIcon: const Icon(
                                            Icons.bookmark_outlined,
                                            color: Color(0xFFFFCC33),
                                            size: 35,
                                          ),
                                          offIcon: Icon(
                                            Icons.bookmark_border_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            size: 35,
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
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}

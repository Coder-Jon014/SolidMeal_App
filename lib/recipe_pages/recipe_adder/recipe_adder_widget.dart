import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recipe_adder_model.dart';
export 'recipe_adder_model.dart';

class RecipeAdderWidget extends StatefulWidget {
  const RecipeAdderWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  _RecipeAdderWidgetState createState() => _RecipeAdderWidgetState();
}

class _RecipeAdderWidgetState extends State<RecipeAdderWidget> {
  late RecipeAdderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipeAdderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultygm = await RecipeInfoCall.call(
        ids: (widget.id).toString(),
      );
      if ((_model.apiResultygm?.succeeded ?? true)) {
        final recipesCreateData = {
          ...createRecipesRecordData(
            recipeTitle: RecipeInfoCall.title(
              (_model.apiResultygm?.jsonBody ?? ''),
            ).toString(),
            recipeImage: RecipeInfoCall.image(
              (_model.apiResultygm?.jsonBody ?? ''),
            ),
            recipeHealthScore: RecipeInfoCall.healthscore(
              (_model.apiResultygm?.jsonBody ?? ''),
            ),
            readyInMinutes: RecipeInfoCall.readyInMinutes(
              (_model.apiResultygm?.jsonBody ?? ''),
            ).toDouble(),
            servings: RecipeInfoCall.servings(
              (_model.apiResultygm?.jsonBody ?? ''),
            ).toDouble(),
            recipeId: widget.id,
            recipeURL: RecipeInfoCall.url(
              (_model.apiResultygm?.jsonBody ?? ''),
            ).toString(),
          ),
          'recipe_instructiona': (RecipeInfoCall.instructions(
            (_model.apiResultygm?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList(),
          'recipe_ingredients': (RecipeInfoCall.ingredientName(
            (_model.apiResultygm?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList(),
          'recipe_ingredient_unit': (RecipeInfoCall.ingredientUnit(
            (_model.apiResultygm?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList(),
          'nutrientAmount': RecipeInfoCall.nutritionAmount(
            (_model.apiResultygm?.jsonBody ?? ''),
          ),
          'nutrientUnit': (RecipeInfoCall.nutrtionUnit(
            (_model.apiResultygm?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList(),
          'nutrientName': (RecipeInfoCall.nutritionName(
            (_model.apiResultygm?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList(),
          'nutrientPercentofDailyNeeds': RecipeInfoCall.percentofDailyNeeds(
            (_model.apiResultygm?.jsonBody ?? ''),
          ),
          'recipe_ingredient_amount': RecipeInfoCall.ingredientAmount(
            (_model.apiResultygm?.jsonBody ?? ''),
          ),
        };
        await RecipesRecord.collection.doc().set(recipesCreateData);

        context.pushNamed(
          'DetailsScreenDatabase',
          queryParams: {
            'recipeId': serializeParam(
              widget.id,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      } else {
        context.pushNamed(
          'DetailsScreen',
          queryParams: {
            'recipeId': serializeParam(
              widget.id,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      }
    });
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

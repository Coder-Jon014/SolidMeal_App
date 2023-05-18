import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../flutter_flow/flutter_flow_util.dart';


import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SimilarRecipesCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SimilarRecipes',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/${id ?? 156992}/similar',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Host':
            'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
        'X-RapidAPI-Key': dotenv.env['X_RAPIDAPI_KEY'] ?? 'API KEY not found',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
}
class RecipesCall {
  static Future<ApiCallResponse> call({
    double? maxSaturatedFat = 1000,
    int? number = 100,
    double? maxSugar = 10000,
    double? maxSodium = 10000,
    // String? intolerances = 'tree nut',
    String? diet = 'none',
    double? maxProtein = 10000,
    double? maxCarbs = 20000,
    double? maxFat = 10000,
    double? maxCalcium = 10000,
    double? maxCholesterol = 10000,
    bool? fillIngredients = true,
    double? minSugar = 10,
    double? minPotassium = 10,
    double? maxPotassium = 10000,
    double? maxFiber = 10000,
    double? minFiber = 10,
    String? query = 'chicken',
    bool? limitLicense = false,
    bool? ignorePantry = true,
    bool? instructionsRequired = false,
    bool? addRecipeInformation = true,
    double? maxMagnesium = 10000,
    String? type = 'main course',
    double? maxCalories = 20000,
    double? minProtein = 10,
    int? offset = 1,
    String? sort = 'popularity',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Recipes',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/complexSearch',
      callType: ApiCallType.GET,
      headers: {
       'X-RapidAPI-Key': dotenv.env['X_RAPIDAPI_KEY'] ?? 'API KEY not found',
        'X-RapidAPI-Host':
            'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      },
      params: {
        'limitLicense': limitLicense,
        'number': number,
        'maxCalories': maxCalories,
        'maxFat': maxFat,
        'maxCalcium': maxCalcium,
        'maxCholesterol': maxCholesterol,
        'maxSaturatedFat': maxSaturatedFat,
        'maxPotassium': maxPotassium,
        'maxSugar': maxSugar,
        'maxSodium': maxSodium,
        'maxFiber': maxFiber,
        'maxMagnesium': maxMagnesium,
        'maxCarbs': maxCarbs,
        'maxProtein': maxProtein,
        // 'intolerances': intolerances,
        'diet': diet,
        'minProtein': minProtein,
        'query': query,
        // 'instructionsRequired': instructionsRequired,
        'fillIngredients': fillIngredients,
        'addRecipeInformation': addRecipeInformation,
        'ignorePantry': ignorePantry,
        'offset': offset,
        'type': type,
        'sort': sort,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic recipes(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.results[:].image''',
        true,
      );
  static dynamic instructions(dynamic response) => getJsonField(
        response,
        r'''$.results[:].analyzedInstructions[:].steps[:].step''',
        true,
      );
  static dynamic nutrientName(dynamic response) => getJsonField(
        response,
        r'''$.results[:].nutrition.nutrients[:].name''',
        true,
      );
  static dynamic nutrientAmount(dynamic response) => getJsonField(
        response,
        r'''$.results[:].nutrition.nutrients[:].amount''',
        true,
      );
  static dynamic nutrientUnit(dynamic response) => getJsonField(
        response,
        r'''$.results[:].nutrition.nutrients[:].unit''',
        true,
      );
  static dynamic healthScore(dynamic response) => getJsonField(
        response,
        r'''$.results[:].healthScore''',
        true,
      );
  static dynamic readyInMinutes(dynamic response) => getJsonField(
        response,
        r'''$.results[:].readyInMinutes''',
        true,
      );
  static dynamic servings(dynamic response) => getJsonField(
        response,
        r'''$.results[:].servings''',
        true,
      );
  static dynamic ids(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
}

class RecipeInfoCall {
  static Future<ApiCallResponse> call({
    String? ids,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RecipeInfo',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/informationBulk',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': dotenv.env['X_RAPIDAPI_KEY'] ?? 'API KEY not found',
        'X-RapidAPI-Host':
            'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
      },
      params: {
        'ids': ids,
        'includeNutrition': true,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic preparationTime(dynamic response) => getJsonField(
        response,
        r'''$[:].preparationMinutes''',
      );
  static dynamic cookingTime(dynamic response) => getJsonField(
        response,
        r'''$[:].cookingMinutes''',
      );
  static dynamic instructions(dynamic response) => getJsonField(
        response,
        r'''$[:].analyzedInstructions[:].steps[:].step''',
        true,
      );
  static dynamic instructionsNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].analyzedInstructions[:].steps[:].number''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$[:].image''',
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$[:].title''',
      );
  static dynamic ingredientImage(dynamic response) => getJsonField(
        response,
        r'''$[:].extendedIngredients[:].image''',
        true,
      );
  static dynamic ingredientName(dynamic response) => getJsonField(
        response,
        r'''$[:].extendedIngredients[:].nameClean''',
        true,
      );
  static dynamic ingredientAmount(dynamic response) => getJsonField(
        response,
        r'''$[:].extendedIngredients[:].amount''',
        true,
      );
  static dynamic ingredientUnit(dynamic response) => getJsonField(
        response,
        r'''$[:].extendedIngredients[:].unit''',
        true,
      );
  static dynamic healthscore(dynamic response) => getJsonField(
        response,
        r'''$[:].healthScore''',
      );
  static dynamic nutritionName(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.nutrients[:].name''',
        true,
      );
  static dynamic nutritionAmount(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.nutrients[:].amount''',
        true,
      );
  static dynamic nutrtionUnit(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.nutrients[:].unit''',
        true,
      );
  static dynamic percentofDailyNeeds(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.nutrients[:].percentOfDailyNeeds''',
        true,
      );
  static dynamic nutrientProperties(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.properties''',
        true,
      );
  static dynamic nutritionPropertiesName(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.properties[:].name''',
        true,
      );
  static dynamic nutritionPropertiesAmount(dynamic response) => getJsonField(
        response,
        r'''$[:].nutrition.properties[:].amount''',
        true,
      );
  static dynamic readyInMinutes(dynamic response) => getJsonField(
        response,
        r'''$[:].readyInMinutes''',
      );
  static dynamic servings(dynamic response) => getJsonField(
        response,
        r'''$[:].servings''',
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$[:].sourceUrl''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}

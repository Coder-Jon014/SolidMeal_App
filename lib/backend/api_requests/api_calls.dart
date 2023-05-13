import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RecipesCall {
  static Future<ApiCallResponse> call({
    double? maxSaturatedFat = 10,
    int? number = 100,
    double? maxSugar = 1000,
    double? maxSodium = 1000,
    String? diet = 'Vegetarian',
    String? intolerances = 'tree nut',
    double? maxProtein = 1000,
    double? maxCarbs = 2000,
    double? maxFat = 1000,
    double? maxCalcium = 1000,
    double? maxCholesterol = 1000,
    double? minSugar = 10,
    double? minPotassium = 10,
    double? maxPotassium = 1000,
    double? maxFiber = 1000,
    double? minFiber = 10,
    String? query = 'chicken',
    bool? limitLicense = true,
    bool? instructionsRequired = true,
    bool? addRecipeInformation = true,
    double? maxMagnesium = 1000,
    String? type = 'main course',
    double? maxCalories = 2000,
    String? cuisine = 'European',
    double? minProtein = 15,
    int? offset = 1,
    String? sort = 'popularity',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Recipes',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/complexSearch',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '994c1691b7msh42adba50cab58fdp1e1050jsnbf29a65cf268',
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
        'intolerances': intolerances,
        'minProtein': minProtein,
        'query': query,
        'instructionsRequired': instructionsRequired,
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
    int? ids,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RecipeInfo',
      apiUrl:
          'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/informationBulk',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '994c1691b7msh42adba50cab58fdp1e1050jsnbf29a65cf268',
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
      cache: false,
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

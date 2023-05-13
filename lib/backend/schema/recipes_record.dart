import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipes_record.g.dart';

abstract class RecipesRecord
    implements Built<RecipesRecord, RecipesRecordBuilder> {
  static Serializer<RecipesRecord> get serializer => _$recipesRecordSerializer;

  @BuiltValueField(wireName: 'recipe_title')
  String? get recipeTitle;

  @BuiltValueField(wireName: 'recipe_image')
  String? get recipeImage;

  @BuiltValueField(wireName: 'recipe_instructiona')
  BuiltList<String>? get recipeInstructiona;

  @BuiltValueField(wireName: 'recipe_ingredients')
  BuiltList<String>? get recipeIngredients;

  @BuiltValueField(wireName: 'recipe_ingredient_unit')
  BuiltList<String>? get recipeIngredientUnit;

  @BuiltValueField(wireName: 'recipe_health_score')
  int? get recipeHealthScore;

  BuiltList<double>? get nutrientAmount;

  BuiltList<String>? get nutrientUnit;

  BuiltList<String>? get nutrientName;

  BuiltList<double>? get nutrientPercentofDailyNeeds;

  double? get readyInMinutes;

  double? get servings;

  @BuiltValueField(wireName: 'recipe_id')
  int? get recipeId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecipesRecordBuilder builder) => builder
    ..recipeTitle = ''
    ..recipeImage = ''
    ..recipeInstructiona = ListBuilder()
    ..recipeIngredients = ListBuilder()
    ..recipeIngredientUnit = ListBuilder()
    ..recipeHealthScore = 0
    ..nutrientAmount = ListBuilder()
    ..nutrientUnit = ListBuilder()
    ..nutrientName = ListBuilder()
    ..nutrientPercentofDailyNeeds = ListBuilder()
    ..readyInMinutes = 0.0
    ..servings = 0.0
    ..recipeId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecipesRecord._();
  factory RecipesRecord([void Function(RecipesRecordBuilder) updates]) =
      _$RecipesRecord;

  static RecipesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecipesRecordData({
  String? recipeTitle,
  String? recipeImage,
  int? recipeHealthScore,
  double? readyInMinutes,
  double? servings,
  int? recipeId,
}) {
  final firestoreData = serializers.toFirestore(
    RecipesRecord.serializer,
    RecipesRecord(
      (r) => r
        ..recipeTitle = recipeTitle
        ..recipeImage = recipeImage
        ..recipeInstructiona = null
        ..recipeIngredients = null
        ..recipeIngredientUnit = null
        ..recipeHealthScore = recipeHealthScore
        ..nutrientAmount = null
        ..nutrientUnit = null
        ..nutrientName = null
        ..nutrientPercentofDailyNeeds = null
        ..readyInMinutes = readyInMinutes
        ..servings = servings
        ..recipeId = recipeId,
    ),
  );

  return firestoreData;
}

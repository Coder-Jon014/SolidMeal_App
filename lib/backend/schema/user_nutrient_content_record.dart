import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_nutrient_content_record.g.dart';

abstract class UserNutrientContentRecord
    implements
        Built<UserNutrientContentRecord, UserNutrientContentRecordBuilder> {
  static Serializer<UserNutrientContentRecord> get serializer =>
      _$userNutrientContentRecordSerializer;

  double? get minCarbs;

  double? get maxCarbs;

  double? get minProtein;

  double? get maxProtein;

  double? get minCalories;

  double? get maxCalories;

  double? get minFat;

  double? get maxFat;

  double? get minCalcium;

  double? get maxCalcium;

  double? get minCholesterol;

  double? get maxCholesterol;

  double? get minSaturatedFat;

  double? get maxSaturatedFat;

  double? get minPotassium;

  double? get maxPotassium;

  double? get minSugar;

  double? get maxSugar;

  double? get minSodium;

  double? get maxSodium;

  double? get maxFiber;

  double? get minFiber;

  double? get maxMagnesium;

  double? get minMagnesium;

  BuiltList<String>? get nutrientUnit;

  BuiltList<String>? get intolerances;

  BuiltList<String>? get diets;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserNutrientContentRecordBuilder builder) =>
      builder
        ..minCarbs = 0.0
        ..maxCarbs = 0.0
        ..minProtein = 0.0
        ..maxProtein = 0.0
        ..minCalories = 0.0
        ..maxCalories = 0.0
        ..minFat = 0.0
        ..maxFat = 0.0
        ..minCalcium = 0.0
        ..maxCalcium = 0.0
        ..minCholesterol = 0.0
        ..maxCholesterol = 0.0
        ..minSaturatedFat = 0.0
        ..maxSaturatedFat = 0.0
        ..minPotassium = 0.0
        ..maxPotassium = 0.0
        ..minSugar = 0.0
        ..maxSugar = 0.0
        ..minSodium = 0.0
        ..maxSodium = 0.0
        ..maxFiber = 0.0
        ..minFiber = 0.0
        ..maxMagnesium = 0.0
        ..minMagnesium = 0.0
        ..nutrientUnit = ListBuilder()
        ..intolerances = ListBuilder()
        ..diets = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_nutrient_content')
          : FirebaseFirestore.instance.collectionGroup('user_nutrient_content');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_nutrient_content').doc();

  static Stream<UserNutrientContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserNutrientContentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserNutrientContentRecord._();
  factory UserNutrientContentRecord(
          [void Function(UserNutrientContentRecordBuilder) updates]) =
      _$UserNutrientContentRecord;

  static UserNutrientContentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserNutrientContentRecordData({
  double? minCarbs,
  double? maxCarbs,
  double? minProtein,
  double? maxProtein,
  double? minCalories,
  double? maxCalories,
  double? minFat,
  double? maxFat,
  double? minCalcium,
  double? maxCalcium,
  double? minCholesterol,
  double? maxCholesterol,
  double? minSaturatedFat,
  double? maxSaturatedFat,
  double? minPotassium,
  double? maxPotassium,
  double? minSugar,
  double? maxSugar,
  double? minSodium,
  double? maxSodium,
  double? maxFiber,
  double? minFiber,
  double? maxMagnesium,
  double? minMagnesium,
}) {
  final firestoreData = serializers.toFirestore(
    UserNutrientContentRecord.serializer,
    UserNutrientContentRecord(
      (u) => u
        ..minCarbs = minCarbs
        ..maxCarbs = maxCarbs
        ..minProtein = minProtein
        ..maxProtein = maxProtein
        ..minCalories = minCalories
        ..maxCalories = maxCalories
        ..minFat = minFat
        ..maxFat = maxFat
        ..minCalcium = minCalcium
        ..maxCalcium = maxCalcium
        ..minCholesterol = minCholesterol
        ..maxCholesterol = maxCholesterol
        ..minSaturatedFat = minSaturatedFat
        ..maxSaturatedFat = maxSaturatedFat
        ..minPotassium = minPotassium
        ..maxPotassium = maxPotassium
        ..minSugar = minSugar
        ..maxSugar = maxSugar
        ..minSodium = minSodium
        ..maxSodium = maxSodium
        ..maxFiber = maxFiber
        ..minFiber = minFiber
        ..maxMagnesium = maxMagnesium
        ..minMagnesium = minMagnesium
        ..nutrientUnit = null
        ..intolerances = null
        ..diets = null,
    ),
  );

  return firestoreData;
}

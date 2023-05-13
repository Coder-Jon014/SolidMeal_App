import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipe_list_record.g.dart';

abstract class RecipeListRecord
    implements Built<RecipeListRecord, RecipeListRecordBuilder> {
  static Serializer<RecipeListRecord> get serializer =>
      _$recipeListRecordSerializer;

  @BuiltValueField(wireName: 'list_of_recipes')
  BuiltList<int>? get listOfRecipes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecipeListRecordBuilder builder) =>
      builder..listOfRecipes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipe_list');

  static Stream<RecipeListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecipeListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecipeListRecord._();
  factory RecipeListRecord([void Function(RecipeListRecordBuilder) updates]) =
      _$RecipeListRecord;

  static RecipeListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecipeListRecordData() {
  final firestoreData = serializers.toFirestore(
    RecipeListRecord.serializer,
    RecipeListRecord(
      (r) => r..listOfRecipes = null,
    ),
  );

  return firestoreData;
}

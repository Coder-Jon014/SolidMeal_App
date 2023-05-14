import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipe_notes_record.g.dart';

abstract class RecipeNotesRecord
    implements Built<RecipeNotesRecord, RecipeNotesRecordBuilder> {
  static Serializer<RecipeNotesRecord> get serializer =>
      _$recipeNotesRecordSerializer;

  String? get recipeNotes;

  String? get recipeNoteGiver;

  String? get recipeNoteGiverImage;

  DateTime? get dateCreated;

  String? get willTry;

  bool? get loved;

  String? get noteTag;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(RecipeNotesRecordBuilder builder) => builder
    ..recipeNotes = ''
    ..recipeNoteGiver = ''
    ..recipeNoteGiverImage = ''
    ..willTry = ''
    ..loved = false
    ..noteTag = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('recipe_notes')
          : FirebaseFirestore.instance.collectionGroup('recipe_notes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('recipe_notes').doc();

  static Stream<RecipeNotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecipeNotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecipeNotesRecord._();
  factory RecipeNotesRecord([void Function(RecipeNotesRecordBuilder) updates]) =
      _$RecipeNotesRecord;

  static RecipeNotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecipeNotesRecordData({
  String? recipeNotes,
  String? recipeNoteGiver,
  String? recipeNoteGiverImage,
  DateTime? dateCreated,
  String? willTry,
  bool? loved,
  String? noteTag,
}) {
  final firestoreData = serializers.toFirestore(
    RecipeNotesRecord.serializer,
    RecipeNotesRecord(
      (r) => r
        ..recipeNotes = recipeNotes
        ..recipeNoteGiver = recipeNoteGiver
        ..recipeNoteGiverImage = recipeNoteGiverImage
        ..dateCreated = dateCreated
        ..willTry = willTry
        ..loved = loved
        ..noteTag = noteTag,
    ),
  );

  return firestoreData;
}

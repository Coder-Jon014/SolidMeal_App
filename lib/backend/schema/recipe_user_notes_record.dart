import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipe_user_notes_record.g.dart';

abstract class RecipeUserNotesRecord
    implements Built<RecipeUserNotesRecord, RecipeUserNotesRecordBuilder> {
  static Serializer<RecipeUserNotesRecord> get serializer =>
      _$recipeUserNotesRecordSerializer;

  String? get recipeNotes;

  String? get recipeNoteGiver;

  String? get recipeNoteGiverImage;

  DateTime? get dateCreated;

  String? get willTry;

  bool? get loved;

  String? get noteTag;

  int? get recipeID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(RecipeUserNotesRecordBuilder builder) =>
      builder
        ..recipeNotes = ''
        ..recipeNoteGiver = ''
        ..recipeNoteGiverImage = ''
        ..willTry = ''
        ..loved = false
        ..noteTag = ''
        ..recipeID = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('recipeUserNotes')
          : FirebaseFirestore.instance.collectionGroup('recipeUserNotes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('recipeUserNotes').doc();

  static Stream<RecipeUserNotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecipeUserNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecipeUserNotesRecord._();
  factory RecipeUserNotesRecord(
          [void Function(RecipeUserNotesRecordBuilder) updates]) =
      _$RecipeUserNotesRecord;

  static RecipeUserNotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecipeUserNotesRecordData({
  String? recipeNotes,
  String? recipeNoteGiver,
  String? recipeNoteGiverImage,
  DateTime? dateCreated,
  String? willTry,
  bool? loved,
  String? noteTag,
  int? recipeID,
}) {
  final firestoreData = serializers.toFirestore(
    RecipeUserNotesRecord.serializer,
    RecipeUserNotesRecord(
      (r) => r
        ..recipeNotes = recipeNotes
        ..recipeNoteGiver = recipeNoteGiver
        ..recipeNoteGiverImage = recipeNoteGiverImage
        ..dateCreated = dateCreated
        ..willTry = willTry
        ..loved = loved
        ..noteTag = noteTag
        ..recipeID = recipeID,
    ),
  );

  return firestoreData;
}

import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notes_for_recipes_record.g.dart';

abstract class NotesForRecipesRecord
    implements Built<NotesForRecipesRecord, NotesForRecipesRecordBuilder> {
  static Serializer<NotesForRecipesRecord> get serializer =>
      _$notesForRecipesRecordSerializer;

  String? get recipeNotes;

  String? get recipeNoteGiver;

  String? get recipeNoteGiverImage;

  int? get recipeId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotesForRecipesRecordBuilder builder) =>
      builder
        ..recipeNotes = ''
        ..recipeNoteGiver = ''
        ..recipeNoteGiverImage = ''
        ..recipeId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notesForRecipes');

  static Stream<NotesForRecipesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotesForRecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotesForRecipesRecord._();
  factory NotesForRecipesRecord(
          [void Function(NotesForRecipesRecordBuilder) updates]) =
      _$NotesForRecipesRecord;

  static NotesForRecipesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotesForRecipesRecordData({
  String? recipeNotes,
  String? recipeNoteGiver,
  String? recipeNoteGiverImage,
  int? recipeId,
}) {
  final firestoreData = serializers.toFirestore(
    NotesForRecipesRecord.serializer,
    NotesForRecipesRecord(
      (n) => n
        ..recipeNotes = recipeNotes
        ..recipeNoteGiver = recipeNoteGiver
        ..recipeNoteGiverImage = recipeNoteGiverImage
        ..recipeId = recipeId,
    ),
  );

  return firestoreData;
}

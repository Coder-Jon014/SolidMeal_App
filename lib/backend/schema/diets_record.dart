import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'diets_record.g.dart';

abstract class DietsRecord implements Built<DietsRecord, DietsRecordBuilder> {
  static Serializer<DietsRecord> get serializer => _$dietsRecordSerializer;

  BuiltList<String>? get diets;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DietsRecordBuilder builder) =>
      builder..diets = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('diets');

  static Stream<DietsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DietsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DietsRecord._();
  factory DietsRecord([void Function(DietsRecordBuilder) updates]) =
      _$DietsRecord;

  static DietsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDietsRecordData() {
  final firestoreData = serializers.toFirestore(
    DietsRecord.serializer,
    DietsRecord(
      (d) => d..diets = null,
    ),
  );

  return firestoreData;
}

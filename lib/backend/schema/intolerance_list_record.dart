import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'intolerance_list_record.g.dart';

abstract class IntoleranceListRecord
    implements Built<IntoleranceListRecord, IntoleranceListRecordBuilder> {
  static Serializer<IntoleranceListRecord> get serializer =>
      _$intoleranceListRecordSerializer;

  String? get intolerance;

  BuiltList<String>? get intoleranceKeyWords;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IntoleranceListRecordBuilder builder) =>
      builder
        ..intolerance = ''
        ..intoleranceKeyWords = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('intoleranceList');

  static Stream<IntoleranceListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IntoleranceListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IntoleranceListRecord._();
  factory IntoleranceListRecord(
          [void Function(IntoleranceListRecordBuilder) updates]) =
      _$IntoleranceListRecord;

  static IntoleranceListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIntoleranceListRecordData({
  String? intolerance,
}) {
  final firestoreData = serializers.toFirestore(
    IntoleranceListRecord.serializer,
    IntoleranceListRecord(
      (i) => i
        ..intolerance = intolerance
        ..intoleranceKeyWords = null,
    ),
  );

  return firestoreData;
}

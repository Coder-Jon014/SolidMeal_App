import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'intolerances_record.g.dart';

abstract class IntolerancesRecord
    implements Built<IntolerancesRecord, IntolerancesRecordBuilder> {
  static Serializer<IntolerancesRecord> get serializer =>
      _$intolerancesRecordSerializer;

  BuiltList<String>? get intolerances;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IntolerancesRecordBuilder builder) =>
      builder..intolerances = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('intolerances');

  static Stream<IntolerancesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IntolerancesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IntolerancesRecord._();
  factory IntolerancesRecord(
          [void Function(IntolerancesRecordBuilder) updates]) =
      _$IntolerancesRecord;

  static IntolerancesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIntolerancesRecordData() {
  final firestoreData = serializers.toFirestore(
    IntolerancesRecord.serializer,
    IntolerancesRecord(
      (i) => i..intolerances = null,
    ),
  );

  return firestoreData;
}

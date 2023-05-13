import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'illnesses_record.g.dart';

abstract class IllnessesRecord
    implements Built<IllnessesRecord, IllnessesRecordBuilder> {
  static Serializer<IllnessesRecord> get serializer =>
      _$illnessesRecordSerializer;

  String? get illness;

  int? get targetSugar;

  int? get targetSodium;

  int? get targetSaturatedFat;

  double? get targetCarbohydrates;

  double? get targetProtein;

  double? get targetFiber;

  double? get targetPotassium;

  double? get targetMagnesium;

  double? get targetCalcium;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IllnessesRecordBuilder builder) => builder
    ..illness = ''
    ..targetSugar = 0
    ..targetSodium = 0
    ..targetSaturatedFat = 0
    ..targetCarbohydrates = 0.0
    ..targetProtein = 0.0
    ..targetFiber = 0.0
    ..targetPotassium = 0.0
    ..targetMagnesium = 0.0
    ..targetCalcium = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('illnesses');

  static Stream<IllnessesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IllnessesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IllnessesRecord._();
  factory IllnessesRecord([void Function(IllnessesRecordBuilder) updates]) =
      _$IllnessesRecord;

  static IllnessesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIllnessesRecordData({
  String? illness,
  int? targetSugar,
  int? targetSodium,
  int? targetSaturatedFat,
  double? targetCarbohydrates,
  double? targetProtein,
  double? targetFiber,
  double? targetPotassium,
  double? targetMagnesium,
  double? targetCalcium,
}) {
  final firestoreData = serializers.toFirestore(
    IllnessesRecord.serializer,
    IllnessesRecord(
      (i) => i
        ..illness = illness
        ..targetSugar = targetSugar
        ..targetSodium = targetSodium
        ..targetSaturatedFat = targetSaturatedFat
        ..targetCarbohydrates = targetCarbohydrates
        ..targetProtein = targetProtein
        ..targetFiber = targetFiber
        ..targetPotassium = targetPotassium
        ..targetMagnesium = targetMagnesium
        ..targetCalcium = targetCalcium,
    ),
  );

  return firestoreData;
}

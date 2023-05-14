import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_favorite_record.g.dart';

abstract class UserFavoriteRecord
    implements Built<UserFavoriteRecord, UserFavoriteRecordBuilder> {
  static Serializer<UserFavoriteRecord> get serializer =>
      _$userFavoriteRecordSerializer;

  String? get userId;

  BuiltList<int>? get recipeId;

  BuiltList<DateTime>? get timeAdded;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserFavoriteRecordBuilder builder) => builder
    ..userId = ''
    ..recipeId = ListBuilder()
    ..timeAdded = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_favorite');

  static Stream<UserFavoriteRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserFavoriteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserFavoriteRecord._();
  factory UserFavoriteRecord(
          [void Function(UserFavoriteRecordBuilder) updates]) =
      _$UserFavoriteRecord;

  static UserFavoriteRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserFavoriteRecordData({
  String? userId,
}) {
  final firestoreData = serializers.toFirestore(
    UserFavoriteRecord.serializer,
    UserFavoriteRecord(
      (u) => u
        ..userId = userId
        ..recipeId = null
        ..timeAdded = null,
    ),
  );

  return firestoreData;
}

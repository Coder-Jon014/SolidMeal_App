// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorite_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserFavoriteRecord> _$userFavoriteRecordSerializer =
    new _$UserFavoriteRecordSerializer();

class _$UserFavoriteRecordSerializer
    implements StructuredSerializer<UserFavoriteRecord> {
  @override
  final Iterable<Type> types = const [UserFavoriteRecord, _$UserFavoriteRecord];
  @override
  final String wireName = 'UserFavoriteRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserFavoriteRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeId;
    if (value != null) {
      result
        ..add('recipeId')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.timeAdded;
    if (value != null) {
      result
        ..add('timeAdded')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserFavoriteRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserFavoriteRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipeId':
          result.recipeId.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'timeAdded':
          result.timeAdded.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserFavoriteRecord extends UserFavoriteRecord {
  @override
  final String? userId;
  @override
  final BuiltList<int>? recipeId;
  @override
  final BuiltList<DateTime>? timeAdded;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserFavoriteRecord(
          [void Function(UserFavoriteRecordBuilder)? updates]) =>
      (new UserFavoriteRecordBuilder()..update(updates))._build();

  _$UserFavoriteRecord._(
      {this.userId, this.recipeId, this.timeAdded, this.ffRef})
      : super._();

  @override
  UserFavoriteRecord rebuild(
          void Function(UserFavoriteRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserFavoriteRecordBuilder toBuilder() =>
      new UserFavoriteRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserFavoriteRecord &&
        userId == other.userId &&
        recipeId == other.recipeId &&
        timeAdded == other.timeAdded &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, timeAdded.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserFavoriteRecord')
          ..add('userId', userId)
          ..add('recipeId', recipeId)
          ..add('timeAdded', timeAdded)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserFavoriteRecordBuilder
    implements Builder<UserFavoriteRecord, UserFavoriteRecordBuilder> {
  _$UserFavoriteRecord? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ListBuilder<int>? _recipeId;
  ListBuilder<int> get recipeId => _$this._recipeId ??= new ListBuilder<int>();
  set recipeId(ListBuilder<int>? recipeId) => _$this._recipeId = recipeId;

  ListBuilder<DateTime>? _timeAdded;
  ListBuilder<DateTime> get timeAdded =>
      _$this._timeAdded ??= new ListBuilder<DateTime>();
  set timeAdded(ListBuilder<DateTime>? timeAdded) =>
      _$this._timeAdded = timeAdded;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserFavoriteRecordBuilder() {
    UserFavoriteRecord._initializeBuilder(this);
  }

  UserFavoriteRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _recipeId = $v.recipeId?.toBuilder();
      _timeAdded = $v.timeAdded?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserFavoriteRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserFavoriteRecord;
  }

  @override
  void update(void Function(UserFavoriteRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserFavoriteRecord build() => _build();

  _$UserFavoriteRecord _build() {
    _$UserFavoriteRecord _$result;
    try {
      _$result = _$v ??
          new _$UserFavoriteRecord._(
              userId: userId,
              recipeId: _recipeId?.build(),
              timeAdded: _timeAdded?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipeId';
        _recipeId?.build();
        _$failedField = 'timeAdded';
        _timeAdded?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserFavoriteRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

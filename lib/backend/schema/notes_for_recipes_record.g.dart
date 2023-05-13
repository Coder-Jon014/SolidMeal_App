// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_for_recipes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotesForRecipesRecord> _$notesForRecipesRecordSerializer =
    new _$NotesForRecipesRecordSerializer();

class _$NotesForRecipesRecordSerializer
    implements StructuredSerializer<NotesForRecipesRecord> {
  @override
  final Iterable<Type> types = const [
    NotesForRecipesRecord,
    _$NotesForRecipesRecord
  ];
  @override
  final String wireName = 'NotesForRecipesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotesForRecipesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.recipeNotes;
    if (value != null) {
      result
        ..add('recipeNotes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeNoteGiver;
    if (value != null) {
      result
        ..add('recipeNoteGiver')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeNoteGiverImage;
    if (value != null) {
      result
        ..add('recipeNoteGiverImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeId;
    if (value != null) {
      result
        ..add('recipeId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  NotesForRecipesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotesForRecipesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'recipeNotes':
          result.recipeNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipeNoteGiver':
          result.recipeNoteGiver = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipeNoteGiverImage':
          result.recipeNoteGiverImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipeId':
          result.recipeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$NotesForRecipesRecord extends NotesForRecipesRecord {
  @override
  final String? recipeNotes;
  @override
  final String? recipeNoteGiver;
  @override
  final String? recipeNoteGiverImage;
  @override
  final int? recipeId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotesForRecipesRecord(
          [void Function(NotesForRecipesRecordBuilder)? updates]) =>
      (new NotesForRecipesRecordBuilder()..update(updates))._build();

  _$NotesForRecipesRecord._(
      {this.recipeNotes,
      this.recipeNoteGiver,
      this.recipeNoteGiverImage,
      this.recipeId,
      this.ffRef})
      : super._();

  @override
  NotesForRecipesRecord rebuild(
          void Function(NotesForRecipesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesForRecipesRecordBuilder toBuilder() =>
      new NotesForRecipesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesForRecipesRecord &&
        recipeNotes == other.recipeNotes &&
        recipeNoteGiver == other.recipeNoteGiver &&
        recipeNoteGiverImage == other.recipeNoteGiverImage &&
        recipeId == other.recipeId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipeNotes.hashCode);
    _$hash = $jc(_$hash, recipeNoteGiver.hashCode);
    _$hash = $jc(_$hash, recipeNoteGiverImage.hashCode);
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesForRecipesRecord')
          ..add('recipeNotes', recipeNotes)
          ..add('recipeNoteGiver', recipeNoteGiver)
          ..add('recipeNoteGiverImage', recipeNoteGiverImage)
          ..add('recipeId', recipeId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotesForRecipesRecordBuilder
    implements Builder<NotesForRecipesRecord, NotesForRecipesRecordBuilder> {
  _$NotesForRecipesRecord? _$v;

  String? _recipeNotes;
  String? get recipeNotes => _$this._recipeNotes;
  set recipeNotes(String? recipeNotes) => _$this._recipeNotes = recipeNotes;

  String? _recipeNoteGiver;
  String? get recipeNoteGiver => _$this._recipeNoteGiver;
  set recipeNoteGiver(String? recipeNoteGiver) =>
      _$this._recipeNoteGiver = recipeNoteGiver;

  String? _recipeNoteGiverImage;
  String? get recipeNoteGiverImage => _$this._recipeNoteGiverImage;
  set recipeNoteGiverImage(String? recipeNoteGiverImage) =>
      _$this._recipeNoteGiverImage = recipeNoteGiverImage;

  int? _recipeId;
  int? get recipeId => _$this._recipeId;
  set recipeId(int? recipeId) => _$this._recipeId = recipeId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotesForRecipesRecordBuilder() {
    NotesForRecipesRecord._initializeBuilder(this);
  }

  NotesForRecipesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeNotes = $v.recipeNotes;
      _recipeNoteGiver = $v.recipeNoteGiver;
      _recipeNoteGiverImage = $v.recipeNoteGiverImage;
      _recipeId = $v.recipeId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotesForRecipesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesForRecipesRecord;
  }

  @override
  void update(void Function(NotesForRecipesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesForRecipesRecord build() => _build();

  _$NotesForRecipesRecord _build() {
    final _$result = _$v ??
        new _$NotesForRecipesRecord._(
            recipeNotes: recipeNotes,
            recipeNoteGiver: recipeNoteGiver,
            recipeNoteGiverImage: recipeNoteGiverImage,
            recipeId: recipeId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

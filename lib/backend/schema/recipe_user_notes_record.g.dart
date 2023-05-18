// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_user_notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipeUserNotesRecord> _$recipeUserNotesRecordSerializer =
    new _$RecipeUserNotesRecordSerializer();

class _$RecipeUserNotesRecordSerializer
    implements StructuredSerializer<RecipeUserNotesRecord> {
  @override
  final Iterable<Type> types = const [
    RecipeUserNotesRecord,
    _$RecipeUserNotesRecord
  ];
  @override
  final String wireName = 'RecipeUserNotesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RecipeUserNotesRecord object,
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
    value = object.dateCreated;
    if (value != null) {
      result
        ..add('dateCreated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.willTry;
    if (value != null) {
      result
        ..add('willTry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.loved;
    if (value != null) {
      result
        ..add('loved')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.noteTag;
    if (value != null) {
      result
        ..add('noteTag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeID;
    if (value != null) {
      result
        ..add('recipeID')
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
  RecipeUserNotesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipeUserNotesRecordBuilder();

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
        case 'dateCreated':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'willTry':
          result.willTry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'loved':
          result.loved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'noteTag':
          result.noteTag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipeID':
          result.recipeID = serializers.deserialize(value,
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

class _$RecipeUserNotesRecord extends RecipeUserNotesRecord {
  @override
  final String? recipeNotes;
  @override
  final String? recipeNoteGiver;
  @override
  final String? recipeNoteGiverImage;
  @override
  final DateTime? dateCreated;
  @override
  final String? willTry;
  @override
  final bool? loved;
  @override
  final String? noteTag;
  @override
  final int? recipeID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecipeUserNotesRecord(
          [void Function(RecipeUserNotesRecordBuilder)? updates]) =>
      (new RecipeUserNotesRecordBuilder()..update(updates))._build();

  _$RecipeUserNotesRecord._(
      {this.recipeNotes,
      this.recipeNoteGiver,
      this.recipeNoteGiverImage,
      this.dateCreated,
      this.willTry,
      this.loved,
      this.noteTag,
      this.recipeID,
      this.ffRef})
      : super._();

  @override
  RecipeUserNotesRecord rebuild(
          void Function(RecipeUserNotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeUserNotesRecordBuilder toBuilder() =>
      new RecipeUserNotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeUserNotesRecord &&
        recipeNotes == other.recipeNotes &&
        recipeNoteGiver == other.recipeNoteGiver &&
        recipeNoteGiverImage == other.recipeNoteGiverImage &&
        dateCreated == other.dateCreated &&
        willTry == other.willTry &&
        loved == other.loved &&
        noteTag == other.noteTag &&
        recipeID == other.recipeID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipeNotes.hashCode);
    _$hash = $jc(_$hash, recipeNoteGiver.hashCode);
    _$hash = $jc(_$hash, recipeNoteGiverImage.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, willTry.hashCode);
    _$hash = $jc(_$hash, loved.hashCode);
    _$hash = $jc(_$hash, noteTag.hashCode);
    _$hash = $jc(_$hash, recipeID.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeUserNotesRecord')
          ..add('recipeNotes', recipeNotes)
          ..add('recipeNoteGiver', recipeNoteGiver)
          ..add('recipeNoteGiverImage', recipeNoteGiverImage)
          ..add('dateCreated', dateCreated)
          ..add('willTry', willTry)
          ..add('loved', loved)
          ..add('noteTag', noteTag)
          ..add('recipeID', recipeID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipeUserNotesRecordBuilder
    implements Builder<RecipeUserNotesRecord, RecipeUserNotesRecordBuilder> {
  _$RecipeUserNotesRecord? _$v;

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

  DateTime? _dateCreated;
  DateTime? get dateCreated => _$this._dateCreated;
  set dateCreated(DateTime? dateCreated) => _$this._dateCreated = dateCreated;

  String? _willTry;
  String? get willTry => _$this._willTry;
  set willTry(String? willTry) => _$this._willTry = willTry;

  bool? _loved;
  bool? get loved => _$this._loved;
  set loved(bool? loved) => _$this._loved = loved;

  String? _noteTag;
  String? get noteTag => _$this._noteTag;
  set noteTag(String? noteTag) => _$this._noteTag = noteTag;

  int? _recipeID;
  int? get recipeID => _$this._recipeID;
  set recipeID(int? recipeID) => _$this._recipeID = recipeID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipeUserNotesRecordBuilder() {
    RecipeUserNotesRecord._initializeBuilder(this);
  }

  RecipeUserNotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeNotes = $v.recipeNotes;
      _recipeNoteGiver = $v.recipeNoteGiver;
      _recipeNoteGiverImage = $v.recipeNoteGiverImage;
      _dateCreated = $v.dateCreated;
      _willTry = $v.willTry;
      _loved = $v.loved;
      _noteTag = $v.noteTag;
      _recipeID = $v.recipeID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeUserNotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeUserNotesRecord;
  }

  @override
  void update(void Function(RecipeUserNotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeUserNotesRecord build() => _build();

  _$RecipeUserNotesRecord _build() {
    final _$result = _$v ??
        new _$RecipeUserNotesRecord._(
            recipeNotes: recipeNotes,
            recipeNoteGiver: recipeNoteGiver,
            recipeNoteGiverImage: recipeNoteGiverImage,
            dateCreated: dateCreated,
            willTry: willTry,
            loved: loved,
            noteTag: noteTag,
            recipeID: recipeID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipeNotesRecord> _$recipeNotesRecordSerializer =
    new _$RecipeNotesRecordSerializer();

class _$RecipeNotesRecordSerializer
    implements StructuredSerializer<RecipeNotesRecord> {
  @override
  final Iterable<Type> types = const [RecipeNotesRecord, _$RecipeNotesRecord];
  @override
  final String wireName = 'RecipeNotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipeNotesRecord object,
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
  RecipeNotesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipeNotesRecordBuilder();

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

class _$RecipeNotesRecord extends RecipeNotesRecord {
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
  final DocumentReference<Object?>? ffRef;

  factory _$RecipeNotesRecord(
          [void Function(RecipeNotesRecordBuilder)? updates]) =>
      (new RecipeNotesRecordBuilder()..update(updates))._build();

  _$RecipeNotesRecord._(
      {this.recipeNotes,
      this.recipeNoteGiver,
      this.recipeNoteGiverImage,
      this.dateCreated,
      this.willTry,
      this.loved,
      this.noteTag,
      this.ffRef})
      : super._();

  @override
  RecipeNotesRecord rebuild(void Function(RecipeNotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeNotesRecordBuilder toBuilder() =>
      new RecipeNotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeNotesRecord &&
        recipeNotes == other.recipeNotes &&
        recipeNoteGiver == other.recipeNoteGiver &&
        recipeNoteGiverImage == other.recipeNoteGiverImage &&
        dateCreated == other.dateCreated &&
        willTry == other.willTry &&
        loved == other.loved &&
        noteTag == other.noteTag &&
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
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeNotesRecord')
          ..add('recipeNotes', recipeNotes)
          ..add('recipeNoteGiver', recipeNoteGiver)
          ..add('recipeNoteGiverImage', recipeNoteGiverImage)
          ..add('dateCreated', dateCreated)
          ..add('willTry', willTry)
          ..add('loved', loved)
          ..add('noteTag', noteTag)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipeNotesRecordBuilder
    implements Builder<RecipeNotesRecord, RecipeNotesRecordBuilder> {
  _$RecipeNotesRecord? _$v;

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

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipeNotesRecordBuilder() {
    RecipeNotesRecord._initializeBuilder(this);
  }

  RecipeNotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeNotes = $v.recipeNotes;
      _recipeNoteGiver = $v.recipeNoteGiver;
      _recipeNoteGiverImage = $v.recipeNoteGiverImage;
      _dateCreated = $v.dateCreated;
      _willTry = $v.willTry;
      _loved = $v.loved;
      _noteTag = $v.noteTag;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeNotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeNotesRecord;
  }

  @override
  void update(void Function(RecipeNotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeNotesRecord build() => _build();

  _$RecipeNotesRecord _build() {
    final _$result = _$v ??
        new _$RecipeNotesRecord._(
            recipeNotes: recipeNotes,
            recipeNoteGiver: recipeNoteGiver,
            recipeNoteGiverImage: recipeNoteGiverImage,
            dateCreated: dateCreated,
            willTry: willTry,
            loved: loved,
            noteTag: noteTag,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipeListRecord> _$recipeListRecordSerializer =
    new _$RecipeListRecordSerializer();

class _$RecipeListRecordSerializer
    implements StructuredSerializer<RecipeListRecord> {
  @override
  final Iterable<Type> types = const [RecipeListRecord, _$RecipeListRecord];
  @override
  final String wireName = 'RecipeListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipeListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.listOfRecipes;
    if (value != null) {
      result
        ..add('list_of_recipes')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
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
  RecipeListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipeListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'list_of_recipes':
          result.listOfRecipes.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
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

class _$RecipeListRecord extends RecipeListRecord {
  @override
  final BuiltList<int>? listOfRecipes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecipeListRecord(
          [void Function(RecipeListRecordBuilder)? updates]) =>
      (new RecipeListRecordBuilder()..update(updates))._build();

  _$RecipeListRecord._({this.listOfRecipes, this.ffRef}) : super._();

  @override
  RecipeListRecord rebuild(void Function(RecipeListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeListRecordBuilder toBuilder() =>
      new RecipeListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeListRecord &&
        listOfRecipes == other.listOfRecipes &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, listOfRecipes.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeListRecord')
          ..add('listOfRecipes', listOfRecipes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipeListRecordBuilder
    implements Builder<RecipeListRecord, RecipeListRecordBuilder> {
  _$RecipeListRecord? _$v;

  ListBuilder<int>? _listOfRecipes;
  ListBuilder<int> get listOfRecipes =>
      _$this._listOfRecipes ??= new ListBuilder<int>();
  set listOfRecipes(ListBuilder<int>? listOfRecipes) =>
      _$this._listOfRecipes = listOfRecipes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipeListRecordBuilder() {
    RecipeListRecord._initializeBuilder(this);
  }

  RecipeListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _listOfRecipes = $v.listOfRecipes?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeListRecord;
  }

  @override
  void update(void Function(RecipeListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeListRecord build() => _build();

  _$RecipeListRecord _build() {
    _$RecipeListRecord _$result;
    try {
      _$result = _$v ??
          new _$RecipeListRecord._(
              listOfRecipes: _listOfRecipes?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'listOfRecipes';
        _listOfRecipes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecipeListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

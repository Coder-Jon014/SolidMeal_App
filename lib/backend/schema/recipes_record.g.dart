// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipesRecord> _$recipesRecordSerializer =
    new _$RecipesRecordSerializer();

class _$RecipesRecordSerializer implements StructuredSerializer<RecipesRecord> {
  @override
  final Iterable<Type> types = const [RecipesRecord, _$RecipesRecord];
  @override
  final String wireName = 'RecipesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.recipeTitle;
    if (value != null) {
      result
        ..add('recipe_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeImage;
    if (value != null) {
      result
        ..add('recipe_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recipeInstructiona;
    if (value != null) {
      result
        ..add('recipe_instructiona')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.recipeIngredients;
    if (value != null) {
      result
        ..add('recipe_ingredients')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.recipeIngredientUnit;
    if (value != null) {
      result
        ..add('recipe_ingredient_unit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.recipeHealthScore;
    if (value != null) {
      result
        ..add('recipe_health_score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nutrientAmount;
    if (value != null) {
      result
        ..add('nutrientAmount')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.nutrientUnit;
    if (value != null) {
      result
        ..add('nutrientUnit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nutrientName;
    if (value != null) {
      result
        ..add('nutrientName')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nutrientPercentofDailyNeeds;
    if (value != null) {
      result
        ..add('nutrientPercentofDailyNeeds')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.readyInMinutes;
    if (value != null) {
      result
        ..add('readyInMinutes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.servings;
    if (value != null) {
      result
        ..add('servings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.recipeId;
    if (value != null) {
      result
        ..add('recipe_id')
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
  RecipesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'recipe_title':
          result.recipeTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipe_image':
          result.recipeImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recipe_instructiona':
          result.recipeInstructiona.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'recipe_ingredients':
          result.recipeIngredients.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'recipe_ingredient_unit':
          result.recipeIngredientUnit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'recipe_health_score':
          result.recipeHealthScore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nutrientAmount':
          result.nutrientAmount.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'nutrientUnit':
          result.nutrientUnit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nutrientName':
          result.nutrientName.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nutrientPercentofDailyNeeds':
          result.nutrientPercentofDailyNeeds.replace(serializers.deserialize(
                  value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'readyInMinutes':
          result.readyInMinutes = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'servings':
          result.servings = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'recipe_id':
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

class _$RecipesRecord extends RecipesRecord {
  @override
  final String? recipeTitle;
  @override
  final String? recipeImage;
  @override
  final BuiltList<String>? recipeInstructiona;
  @override
  final BuiltList<String>? recipeIngredients;
  @override
  final BuiltList<String>? recipeIngredientUnit;
  @override
  final int? recipeHealthScore;
  @override
  final BuiltList<double>? nutrientAmount;
  @override
  final BuiltList<String>? nutrientUnit;
  @override
  final BuiltList<String>? nutrientName;
  @override
  final BuiltList<double>? nutrientPercentofDailyNeeds;
  @override
  final double? readyInMinutes;
  @override
  final double? servings;
  @override
  final int? recipeId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecipesRecord([void Function(RecipesRecordBuilder)? updates]) =>
      (new RecipesRecordBuilder()..update(updates))._build();

  _$RecipesRecord._(
      {this.recipeTitle,
      this.recipeImage,
      this.recipeInstructiona,
      this.recipeIngredients,
      this.recipeIngredientUnit,
      this.recipeHealthScore,
      this.nutrientAmount,
      this.nutrientUnit,
      this.nutrientName,
      this.nutrientPercentofDailyNeeds,
      this.readyInMinutes,
      this.servings,
      this.recipeId,
      this.ffRef})
      : super._();

  @override
  RecipesRecord rebuild(void Function(RecipesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipesRecordBuilder toBuilder() => new RecipesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipesRecord &&
        recipeTitle == other.recipeTitle &&
        recipeImage == other.recipeImage &&
        recipeInstructiona == other.recipeInstructiona &&
        recipeIngredients == other.recipeIngredients &&
        recipeIngredientUnit == other.recipeIngredientUnit &&
        recipeHealthScore == other.recipeHealthScore &&
        nutrientAmount == other.nutrientAmount &&
        nutrientUnit == other.nutrientUnit &&
        nutrientName == other.nutrientName &&
        nutrientPercentofDailyNeeds == other.nutrientPercentofDailyNeeds &&
        readyInMinutes == other.readyInMinutes &&
        servings == other.servings &&
        recipeId == other.recipeId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipeTitle.hashCode);
    _$hash = $jc(_$hash, recipeImage.hashCode);
    _$hash = $jc(_$hash, recipeInstructiona.hashCode);
    _$hash = $jc(_$hash, recipeIngredients.hashCode);
    _$hash = $jc(_$hash, recipeIngredientUnit.hashCode);
    _$hash = $jc(_$hash, recipeHealthScore.hashCode);
    _$hash = $jc(_$hash, nutrientAmount.hashCode);
    _$hash = $jc(_$hash, nutrientUnit.hashCode);
    _$hash = $jc(_$hash, nutrientName.hashCode);
    _$hash = $jc(_$hash, nutrientPercentofDailyNeeds.hashCode);
    _$hash = $jc(_$hash, readyInMinutes.hashCode);
    _$hash = $jc(_$hash, servings.hashCode);
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipesRecord')
          ..add('recipeTitle', recipeTitle)
          ..add('recipeImage', recipeImage)
          ..add('recipeInstructiona', recipeInstructiona)
          ..add('recipeIngredients', recipeIngredients)
          ..add('recipeIngredientUnit', recipeIngredientUnit)
          ..add('recipeHealthScore', recipeHealthScore)
          ..add('nutrientAmount', nutrientAmount)
          ..add('nutrientUnit', nutrientUnit)
          ..add('nutrientName', nutrientName)
          ..add('nutrientPercentofDailyNeeds', nutrientPercentofDailyNeeds)
          ..add('readyInMinutes', readyInMinutes)
          ..add('servings', servings)
          ..add('recipeId', recipeId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipesRecordBuilder
    implements Builder<RecipesRecord, RecipesRecordBuilder> {
  _$RecipesRecord? _$v;

  String? _recipeTitle;
  String? get recipeTitle => _$this._recipeTitle;
  set recipeTitle(String? recipeTitle) => _$this._recipeTitle = recipeTitle;

  String? _recipeImage;
  String? get recipeImage => _$this._recipeImage;
  set recipeImage(String? recipeImage) => _$this._recipeImage = recipeImage;

  ListBuilder<String>? _recipeInstructiona;
  ListBuilder<String> get recipeInstructiona =>
      _$this._recipeInstructiona ??= new ListBuilder<String>();
  set recipeInstructiona(ListBuilder<String>? recipeInstructiona) =>
      _$this._recipeInstructiona = recipeInstructiona;

  ListBuilder<String>? _recipeIngredients;
  ListBuilder<String> get recipeIngredients =>
      _$this._recipeIngredients ??= new ListBuilder<String>();
  set recipeIngredients(ListBuilder<String>? recipeIngredients) =>
      _$this._recipeIngredients = recipeIngredients;

  ListBuilder<String>? _recipeIngredientUnit;
  ListBuilder<String> get recipeIngredientUnit =>
      _$this._recipeIngredientUnit ??= new ListBuilder<String>();
  set recipeIngredientUnit(ListBuilder<String>? recipeIngredientUnit) =>
      _$this._recipeIngredientUnit = recipeIngredientUnit;

  int? _recipeHealthScore;
  int? get recipeHealthScore => _$this._recipeHealthScore;
  set recipeHealthScore(int? recipeHealthScore) =>
      _$this._recipeHealthScore = recipeHealthScore;

  ListBuilder<double>? _nutrientAmount;
  ListBuilder<double> get nutrientAmount =>
      _$this._nutrientAmount ??= new ListBuilder<double>();
  set nutrientAmount(ListBuilder<double>? nutrientAmount) =>
      _$this._nutrientAmount = nutrientAmount;

  ListBuilder<String>? _nutrientUnit;
  ListBuilder<String> get nutrientUnit =>
      _$this._nutrientUnit ??= new ListBuilder<String>();
  set nutrientUnit(ListBuilder<String>? nutrientUnit) =>
      _$this._nutrientUnit = nutrientUnit;

  ListBuilder<String>? _nutrientName;
  ListBuilder<String> get nutrientName =>
      _$this._nutrientName ??= new ListBuilder<String>();
  set nutrientName(ListBuilder<String>? nutrientName) =>
      _$this._nutrientName = nutrientName;

  ListBuilder<double>? _nutrientPercentofDailyNeeds;
  ListBuilder<double> get nutrientPercentofDailyNeeds =>
      _$this._nutrientPercentofDailyNeeds ??= new ListBuilder<double>();
  set nutrientPercentofDailyNeeds(
          ListBuilder<double>? nutrientPercentofDailyNeeds) =>
      _$this._nutrientPercentofDailyNeeds = nutrientPercentofDailyNeeds;

  double? _readyInMinutes;
  double? get readyInMinutes => _$this._readyInMinutes;
  set readyInMinutes(double? readyInMinutes) =>
      _$this._readyInMinutes = readyInMinutes;

  double? _servings;
  double? get servings => _$this._servings;
  set servings(double? servings) => _$this._servings = servings;

  int? _recipeId;
  int? get recipeId => _$this._recipeId;
  set recipeId(int? recipeId) => _$this._recipeId = recipeId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipesRecordBuilder() {
    RecipesRecord._initializeBuilder(this);
  }

  RecipesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeTitle = $v.recipeTitle;
      _recipeImage = $v.recipeImage;
      _recipeInstructiona = $v.recipeInstructiona?.toBuilder();
      _recipeIngredients = $v.recipeIngredients?.toBuilder();
      _recipeIngredientUnit = $v.recipeIngredientUnit?.toBuilder();
      _recipeHealthScore = $v.recipeHealthScore;
      _nutrientAmount = $v.nutrientAmount?.toBuilder();
      _nutrientUnit = $v.nutrientUnit?.toBuilder();
      _nutrientName = $v.nutrientName?.toBuilder();
      _nutrientPercentofDailyNeeds =
          $v.nutrientPercentofDailyNeeds?.toBuilder();
      _readyInMinutes = $v.readyInMinutes;
      _servings = $v.servings;
      _recipeId = $v.recipeId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipesRecord;
  }

  @override
  void update(void Function(RecipesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipesRecord build() => _build();

  _$RecipesRecord _build() {
    _$RecipesRecord _$result;
    try {
      _$result = _$v ??
          new _$RecipesRecord._(
              recipeTitle: recipeTitle,
              recipeImage: recipeImage,
              recipeInstructiona: _recipeInstructiona?.build(),
              recipeIngredients: _recipeIngredients?.build(),
              recipeIngredientUnit: _recipeIngredientUnit?.build(),
              recipeHealthScore: recipeHealthScore,
              nutrientAmount: _nutrientAmount?.build(),
              nutrientUnit: _nutrientUnit?.build(),
              nutrientName: _nutrientName?.build(),
              nutrientPercentofDailyNeeds:
                  _nutrientPercentofDailyNeeds?.build(),
              readyInMinutes: readyInMinutes,
              servings: servings,
              recipeId: recipeId,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipeInstructiona';
        _recipeInstructiona?.build();
        _$failedField = 'recipeIngredients';
        _recipeIngredients?.build();
        _$failedField = 'recipeIngredientUnit';
        _recipeIngredientUnit?.build();

        _$failedField = 'nutrientAmount';
        _nutrientAmount?.build();
        _$failedField = 'nutrientUnit';
        _nutrientUnit?.build();
        _$failedField = 'nutrientName';
        _nutrientName?.build();
        _$failedField = 'nutrientPercentofDailyNeeds';
        _nutrientPercentofDailyNeeds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecipesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

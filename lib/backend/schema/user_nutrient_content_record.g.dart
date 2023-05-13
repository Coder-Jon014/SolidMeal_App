// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_nutrient_content_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserNutrientContentRecord> _$userNutrientContentRecordSerializer =
    new _$UserNutrientContentRecordSerializer();

class _$UserNutrientContentRecordSerializer
    implements StructuredSerializer<UserNutrientContentRecord> {
  @override
  final Iterable<Type> types = const [
    UserNutrientContentRecord,
    _$UserNutrientContentRecord
  ];
  @override
  final String wireName = 'UserNutrientContentRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserNutrientContentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.minCarbs;
    if (value != null) {
      result
        ..add('minCarbs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxCarbs;
    if (value != null) {
      result
        ..add('maxCarbs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minProtein;
    if (value != null) {
      result
        ..add('minProtein')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxProtein;
    if (value != null) {
      result
        ..add('maxProtein')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minCalories;
    if (value != null) {
      result
        ..add('minCalories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxCalories;
    if (value != null) {
      result
        ..add('maxCalories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minFat;
    if (value != null) {
      result
        ..add('minFat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxFat;
    if (value != null) {
      result
        ..add('maxFat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minCalcium;
    if (value != null) {
      result
        ..add('minCalcium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxCalcium;
    if (value != null) {
      result
        ..add('maxCalcium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minCholesterol;
    if (value != null) {
      result
        ..add('minCholesterol')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxCholesterol;
    if (value != null) {
      result
        ..add('maxCholesterol')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minSaturatedFat;
    if (value != null) {
      result
        ..add('minSaturatedFat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxSaturatedFat;
    if (value != null) {
      result
        ..add('maxSaturatedFat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minPotassium;
    if (value != null) {
      result
        ..add('minPotassium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxPotassium;
    if (value != null) {
      result
        ..add('maxPotassium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minSugar;
    if (value != null) {
      result
        ..add('minSugar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxSugar;
    if (value != null) {
      result
        ..add('maxSugar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minSodium;
    if (value != null) {
      result
        ..add('minSodium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxSodium;
    if (value != null) {
      result
        ..add('maxSodium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxFiber;
    if (value != null) {
      result
        ..add('maxFiber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minFiber;
    if (value != null) {
      result
        ..add('minFiber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxMagnesium;
    if (value != null) {
      result
        ..add('maxMagnesium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.minMagnesium;
    if (value != null) {
      result
        ..add('minMagnesium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.nutrientUnit;
    if (value != null) {
      result
        ..add('nutrientUnit')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.intolerances;
    if (value != null) {
      result
        ..add('intolerances')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.diets;
    if (value != null) {
      result
        ..add('diets')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  UserNutrientContentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserNutrientContentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'minCarbs':
          result.minCarbs = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxCarbs':
          result.maxCarbs = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minProtein':
          result.minProtein = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxProtein':
          result.maxProtein = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minCalories':
          result.minCalories = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxCalories':
          result.maxCalories = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minFat':
          result.minFat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxFat':
          result.maxFat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minCalcium':
          result.minCalcium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxCalcium':
          result.maxCalcium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minCholesterol':
          result.minCholesterol = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxCholesterol':
          result.maxCholesterol = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minSaturatedFat':
          result.minSaturatedFat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxSaturatedFat':
          result.maxSaturatedFat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minPotassium':
          result.minPotassium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxPotassium':
          result.maxPotassium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minSugar':
          result.minSugar = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxSugar':
          result.maxSugar = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minSodium':
          result.minSodium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxSodium':
          result.maxSodium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxFiber':
          result.maxFiber = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minFiber':
          result.minFiber = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxMagnesium':
          result.maxMagnesium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'minMagnesium':
          result.minMagnesium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'nutrientUnit':
          result.nutrientUnit.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'intolerances':
          result.intolerances.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'diets':
          result.diets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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

class _$UserNutrientContentRecord extends UserNutrientContentRecord {
  @override
  final double? minCarbs;
  @override
  final double? maxCarbs;
  @override
  final double? minProtein;
  @override
  final double? maxProtein;
  @override
  final double? minCalories;
  @override
  final double? maxCalories;
  @override
  final double? minFat;
  @override
  final double? maxFat;
  @override
  final double? minCalcium;
  @override
  final double? maxCalcium;
  @override
  final double? minCholesterol;
  @override
  final double? maxCholesterol;
  @override
  final double? minSaturatedFat;
  @override
  final double? maxSaturatedFat;
  @override
  final double? minPotassium;
  @override
  final double? maxPotassium;
  @override
  final double? minSugar;
  @override
  final double? maxSugar;
  @override
  final double? minSodium;
  @override
  final double? maxSodium;
  @override
  final double? maxFiber;
  @override
  final double? minFiber;
  @override
  final double? maxMagnesium;
  @override
  final double? minMagnesium;
  @override
  final BuiltList<String>? nutrientUnit;
  @override
  final BuiltList<String>? intolerances;
  @override
  final BuiltList<String>? diets;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserNutrientContentRecord(
          [void Function(UserNutrientContentRecordBuilder)? updates]) =>
      (new UserNutrientContentRecordBuilder()..update(updates))._build();

  _$UserNutrientContentRecord._(
      {this.minCarbs,
      this.maxCarbs,
      this.minProtein,
      this.maxProtein,
      this.minCalories,
      this.maxCalories,
      this.minFat,
      this.maxFat,
      this.minCalcium,
      this.maxCalcium,
      this.minCholesterol,
      this.maxCholesterol,
      this.minSaturatedFat,
      this.maxSaturatedFat,
      this.minPotassium,
      this.maxPotassium,
      this.minSugar,
      this.maxSugar,
      this.minSodium,
      this.maxSodium,
      this.maxFiber,
      this.minFiber,
      this.maxMagnesium,
      this.minMagnesium,
      this.nutrientUnit,
      this.intolerances,
      this.diets,
      this.ffRef})
      : super._();

  @override
  UserNutrientContentRecord rebuild(
          void Function(UserNutrientContentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserNutrientContentRecordBuilder toBuilder() =>
      new UserNutrientContentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserNutrientContentRecord &&
        minCarbs == other.minCarbs &&
        maxCarbs == other.maxCarbs &&
        minProtein == other.minProtein &&
        maxProtein == other.maxProtein &&
        minCalories == other.minCalories &&
        maxCalories == other.maxCalories &&
        minFat == other.minFat &&
        maxFat == other.maxFat &&
        minCalcium == other.minCalcium &&
        maxCalcium == other.maxCalcium &&
        minCholesterol == other.minCholesterol &&
        maxCholesterol == other.maxCholesterol &&
        minSaturatedFat == other.minSaturatedFat &&
        maxSaturatedFat == other.maxSaturatedFat &&
        minPotassium == other.minPotassium &&
        maxPotassium == other.maxPotassium &&
        minSugar == other.minSugar &&
        maxSugar == other.maxSugar &&
        minSodium == other.minSodium &&
        maxSodium == other.maxSodium &&
        maxFiber == other.maxFiber &&
        minFiber == other.minFiber &&
        maxMagnesium == other.maxMagnesium &&
        minMagnesium == other.minMagnesium &&
        nutrientUnit == other.nutrientUnit &&
        intolerances == other.intolerances &&
        diets == other.diets &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, minCarbs.hashCode);
    _$hash = $jc(_$hash, maxCarbs.hashCode);
    _$hash = $jc(_$hash, minProtein.hashCode);
    _$hash = $jc(_$hash, maxProtein.hashCode);
    _$hash = $jc(_$hash, minCalories.hashCode);
    _$hash = $jc(_$hash, maxCalories.hashCode);
    _$hash = $jc(_$hash, minFat.hashCode);
    _$hash = $jc(_$hash, maxFat.hashCode);
    _$hash = $jc(_$hash, minCalcium.hashCode);
    _$hash = $jc(_$hash, maxCalcium.hashCode);
    _$hash = $jc(_$hash, minCholesterol.hashCode);
    _$hash = $jc(_$hash, maxCholesterol.hashCode);
    _$hash = $jc(_$hash, minSaturatedFat.hashCode);
    _$hash = $jc(_$hash, maxSaturatedFat.hashCode);
    _$hash = $jc(_$hash, minPotassium.hashCode);
    _$hash = $jc(_$hash, maxPotassium.hashCode);
    _$hash = $jc(_$hash, minSugar.hashCode);
    _$hash = $jc(_$hash, maxSugar.hashCode);
    _$hash = $jc(_$hash, minSodium.hashCode);
    _$hash = $jc(_$hash, maxSodium.hashCode);
    _$hash = $jc(_$hash, maxFiber.hashCode);
    _$hash = $jc(_$hash, minFiber.hashCode);
    _$hash = $jc(_$hash, maxMagnesium.hashCode);
    _$hash = $jc(_$hash, minMagnesium.hashCode);
    _$hash = $jc(_$hash, nutrientUnit.hashCode);
    _$hash = $jc(_$hash, intolerances.hashCode);
    _$hash = $jc(_$hash, diets.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserNutrientContentRecord')
          ..add('minCarbs', minCarbs)
          ..add('maxCarbs', maxCarbs)
          ..add('minProtein', minProtein)
          ..add('maxProtein', maxProtein)
          ..add('minCalories', minCalories)
          ..add('maxCalories', maxCalories)
          ..add('minFat', minFat)
          ..add('maxFat', maxFat)
          ..add('minCalcium', minCalcium)
          ..add('maxCalcium', maxCalcium)
          ..add('minCholesterol', minCholesterol)
          ..add('maxCholesterol', maxCholesterol)
          ..add('minSaturatedFat', minSaturatedFat)
          ..add('maxSaturatedFat', maxSaturatedFat)
          ..add('minPotassium', minPotassium)
          ..add('maxPotassium', maxPotassium)
          ..add('minSugar', minSugar)
          ..add('maxSugar', maxSugar)
          ..add('minSodium', minSodium)
          ..add('maxSodium', maxSodium)
          ..add('maxFiber', maxFiber)
          ..add('minFiber', minFiber)
          ..add('maxMagnesium', maxMagnesium)
          ..add('minMagnesium', minMagnesium)
          ..add('nutrientUnit', nutrientUnit)
          ..add('intolerances', intolerances)
          ..add('diets', diets)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserNutrientContentRecordBuilder
    implements
        Builder<UserNutrientContentRecord, UserNutrientContentRecordBuilder> {
  _$UserNutrientContentRecord? _$v;

  double? _minCarbs;
  double? get minCarbs => _$this._minCarbs;
  set minCarbs(double? minCarbs) => _$this._minCarbs = minCarbs;

  double? _maxCarbs;
  double? get maxCarbs => _$this._maxCarbs;
  set maxCarbs(double? maxCarbs) => _$this._maxCarbs = maxCarbs;

  double? _minProtein;
  double? get minProtein => _$this._minProtein;
  set minProtein(double? minProtein) => _$this._minProtein = minProtein;

  double? _maxProtein;
  double? get maxProtein => _$this._maxProtein;
  set maxProtein(double? maxProtein) => _$this._maxProtein = maxProtein;

  double? _minCalories;
  double? get minCalories => _$this._minCalories;
  set minCalories(double? minCalories) => _$this._minCalories = minCalories;

  double? _maxCalories;
  double? get maxCalories => _$this._maxCalories;
  set maxCalories(double? maxCalories) => _$this._maxCalories = maxCalories;

  double? _minFat;
  double? get minFat => _$this._minFat;
  set minFat(double? minFat) => _$this._minFat = minFat;

  double? _maxFat;
  double? get maxFat => _$this._maxFat;
  set maxFat(double? maxFat) => _$this._maxFat = maxFat;

  double? _minCalcium;
  double? get minCalcium => _$this._minCalcium;
  set minCalcium(double? minCalcium) => _$this._minCalcium = minCalcium;

  double? _maxCalcium;
  double? get maxCalcium => _$this._maxCalcium;
  set maxCalcium(double? maxCalcium) => _$this._maxCalcium = maxCalcium;

  double? _minCholesterol;
  double? get minCholesterol => _$this._minCholesterol;
  set minCholesterol(double? minCholesterol) =>
      _$this._minCholesterol = minCholesterol;

  double? _maxCholesterol;
  double? get maxCholesterol => _$this._maxCholesterol;
  set maxCholesterol(double? maxCholesterol) =>
      _$this._maxCholesterol = maxCholesterol;

  double? _minSaturatedFat;
  double? get minSaturatedFat => _$this._minSaturatedFat;
  set minSaturatedFat(double? minSaturatedFat) =>
      _$this._minSaturatedFat = minSaturatedFat;

  double? _maxSaturatedFat;
  double? get maxSaturatedFat => _$this._maxSaturatedFat;
  set maxSaturatedFat(double? maxSaturatedFat) =>
      _$this._maxSaturatedFat = maxSaturatedFat;

  double? _minPotassium;
  double? get minPotassium => _$this._minPotassium;
  set minPotassium(double? minPotassium) => _$this._minPotassium = minPotassium;

  double? _maxPotassium;
  double? get maxPotassium => _$this._maxPotassium;
  set maxPotassium(double? maxPotassium) => _$this._maxPotassium = maxPotassium;

  double? _minSugar;
  double? get minSugar => _$this._minSugar;
  set minSugar(double? minSugar) => _$this._minSugar = minSugar;

  double? _maxSugar;
  double? get maxSugar => _$this._maxSugar;
  set maxSugar(double? maxSugar) => _$this._maxSugar = maxSugar;

  double? _minSodium;
  double? get minSodium => _$this._minSodium;
  set minSodium(double? minSodium) => _$this._minSodium = minSodium;

  double? _maxSodium;
  double? get maxSodium => _$this._maxSodium;
  set maxSodium(double? maxSodium) => _$this._maxSodium = maxSodium;

  double? _maxFiber;
  double? get maxFiber => _$this._maxFiber;
  set maxFiber(double? maxFiber) => _$this._maxFiber = maxFiber;

  double? _minFiber;
  double? get minFiber => _$this._minFiber;
  set minFiber(double? minFiber) => _$this._minFiber = minFiber;

  double? _maxMagnesium;
  double? get maxMagnesium => _$this._maxMagnesium;
  set maxMagnesium(double? maxMagnesium) => _$this._maxMagnesium = maxMagnesium;

  double? _minMagnesium;
  double? get minMagnesium => _$this._minMagnesium;
  set minMagnesium(double? minMagnesium) => _$this._minMagnesium = minMagnesium;

  ListBuilder<String>? _nutrientUnit;
  ListBuilder<String> get nutrientUnit =>
      _$this._nutrientUnit ??= new ListBuilder<String>();
  set nutrientUnit(ListBuilder<String>? nutrientUnit) =>
      _$this._nutrientUnit = nutrientUnit;

  ListBuilder<String>? _intolerances;
  ListBuilder<String> get intolerances =>
      _$this._intolerances ??= new ListBuilder<String>();
  set intolerances(ListBuilder<String>? intolerances) =>
      _$this._intolerances = intolerances;

  ListBuilder<String>? _diets;
  ListBuilder<String> get diets => _$this._diets ??= new ListBuilder<String>();
  set diets(ListBuilder<String>? diets) => _$this._diets = diets;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserNutrientContentRecordBuilder() {
    UserNutrientContentRecord._initializeBuilder(this);
  }

  UserNutrientContentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _minCarbs = $v.minCarbs;
      _maxCarbs = $v.maxCarbs;
      _minProtein = $v.minProtein;
      _maxProtein = $v.maxProtein;
      _minCalories = $v.minCalories;
      _maxCalories = $v.maxCalories;
      _minFat = $v.minFat;
      _maxFat = $v.maxFat;
      _minCalcium = $v.minCalcium;
      _maxCalcium = $v.maxCalcium;
      _minCholesterol = $v.minCholesterol;
      _maxCholesterol = $v.maxCholesterol;
      _minSaturatedFat = $v.minSaturatedFat;
      _maxSaturatedFat = $v.maxSaturatedFat;
      _minPotassium = $v.minPotassium;
      _maxPotassium = $v.maxPotassium;
      _minSugar = $v.minSugar;
      _maxSugar = $v.maxSugar;
      _minSodium = $v.minSodium;
      _maxSodium = $v.maxSodium;
      _maxFiber = $v.maxFiber;
      _minFiber = $v.minFiber;
      _maxMagnesium = $v.maxMagnesium;
      _minMagnesium = $v.minMagnesium;
      _nutrientUnit = $v.nutrientUnit?.toBuilder();
      _intolerances = $v.intolerances?.toBuilder();
      _diets = $v.diets?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserNutrientContentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserNutrientContentRecord;
  }

  @override
  void update(void Function(UserNutrientContentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserNutrientContentRecord build() => _build();

  _$UserNutrientContentRecord _build() {
    _$UserNutrientContentRecord _$result;
    try {
      _$result = _$v ??
          new _$UserNutrientContentRecord._(
              minCarbs: minCarbs,
              maxCarbs: maxCarbs,
              minProtein: minProtein,
              maxProtein: maxProtein,
              minCalories: minCalories,
              maxCalories: maxCalories,
              minFat: minFat,
              maxFat: maxFat,
              minCalcium: minCalcium,
              maxCalcium: maxCalcium,
              minCholesterol: minCholesterol,
              maxCholesterol: maxCholesterol,
              minSaturatedFat: minSaturatedFat,
              maxSaturatedFat: maxSaturatedFat,
              minPotassium: minPotassium,
              maxPotassium: maxPotassium,
              minSugar: minSugar,
              maxSugar: maxSugar,
              minSodium: minSodium,
              maxSodium: maxSodium,
              maxFiber: maxFiber,
              minFiber: minFiber,
              maxMagnesium: maxMagnesium,
              minMagnesium: minMagnesium,
              nutrientUnit: _nutrientUnit?.build(),
              intolerances: _intolerances?.build(),
              diets: _diets?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nutrientUnit';
        _nutrientUnit?.build();
        _$failedField = 'intolerances';
        _intolerances?.build();
        _$failedField = 'diets';
        _diets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserNutrientContentRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'illnesses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IllnessesRecord> _$illnessesRecordSerializer =
    new _$IllnessesRecordSerializer();

class _$IllnessesRecordSerializer
    implements StructuredSerializer<IllnessesRecord> {
  @override
  final Iterable<Type> types = const [IllnessesRecord, _$IllnessesRecord];
  @override
  final String wireName = 'IllnessesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, IllnessesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.illness;
    if (value != null) {
      result
        ..add('illness')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.targetSugar;
    if (value != null) {
      result
        ..add('targetSugar')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.targetSodium;
    if (value != null) {
      result
        ..add('targetSodium')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.targetSaturatedFat;
    if (value != null) {
      result
        ..add('targetSaturatedFat')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.targetCarbohydrates;
    if (value != null) {
      result
        ..add('targetCarbohydrates')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.targetProtein;
    if (value != null) {
      result
        ..add('targetProtein')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.targetFiber;
    if (value != null) {
      result
        ..add('targetFiber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.targetPotassium;
    if (value != null) {
      result
        ..add('targetPotassium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.targetMagnesium;
    if (value != null) {
      result
        ..add('targetMagnesium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.targetCalcium;
    if (value != null) {
      result
        ..add('targetCalcium')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  IllnessesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IllnessesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'illness':
          result.illness = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'targetSugar':
          result.targetSugar = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'targetSodium':
          result.targetSodium = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'targetSaturatedFat':
          result.targetSaturatedFat = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'targetCarbohydrates':
          result.targetCarbohydrates = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'targetProtein':
          result.targetProtein = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'targetFiber':
          result.targetFiber = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'targetPotassium':
          result.targetPotassium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'targetMagnesium':
          result.targetMagnesium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'targetCalcium':
          result.targetCalcium = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$IllnessesRecord extends IllnessesRecord {
  @override
  final String? illness;
  @override
  final int? targetSugar;
  @override
  final int? targetSodium;
  @override
  final int? targetSaturatedFat;
  @override
  final double? targetCarbohydrates;
  @override
  final double? targetProtein;
  @override
  final double? targetFiber;
  @override
  final double? targetPotassium;
  @override
  final double? targetMagnesium;
  @override
  final double? targetCalcium;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IllnessesRecord([void Function(IllnessesRecordBuilder)? updates]) =>
      (new IllnessesRecordBuilder()..update(updates))._build();

  _$IllnessesRecord._(
      {this.illness,
      this.targetSugar,
      this.targetSodium,
      this.targetSaturatedFat,
      this.targetCarbohydrates,
      this.targetProtein,
      this.targetFiber,
      this.targetPotassium,
      this.targetMagnesium,
      this.targetCalcium,
      this.ffRef})
      : super._();

  @override
  IllnessesRecord rebuild(void Function(IllnessesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IllnessesRecordBuilder toBuilder() =>
      new IllnessesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IllnessesRecord &&
        illness == other.illness &&
        targetSugar == other.targetSugar &&
        targetSodium == other.targetSodium &&
        targetSaturatedFat == other.targetSaturatedFat &&
        targetCarbohydrates == other.targetCarbohydrates &&
        targetProtein == other.targetProtein &&
        targetFiber == other.targetFiber &&
        targetPotassium == other.targetPotassium &&
        targetMagnesium == other.targetMagnesium &&
        targetCalcium == other.targetCalcium &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, illness.hashCode);
    _$hash = $jc(_$hash, targetSugar.hashCode);
    _$hash = $jc(_$hash, targetSodium.hashCode);
    _$hash = $jc(_$hash, targetSaturatedFat.hashCode);
    _$hash = $jc(_$hash, targetCarbohydrates.hashCode);
    _$hash = $jc(_$hash, targetProtein.hashCode);
    _$hash = $jc(_$hash, targetFiber.hashCode);
    _$hash = $jc(_$hash, targetPotassium.hashCode);
    _$hash = $jc(_$hash, targetMagnesium.hashCode);
    _$hash = $jc(_$hash, targetCalcium.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IllnessesRecord')
          ..add('illness', illness)
          ..add('targetSugar', targetSugar)
          ..add('targetSodium', targetSodium)
          ..add('targetSaturatedFat', targetSaturatedFat)
          ..add('targetCarbohydrates', targetCarbohydrates)
          ..add('targetProtein', targetProtein)
          ..add('targetFiber', targetFiber)
          ..add('targetPotassium', targetPotassium)
          ..add('targetMagnesium', targetMagnesium)
          ..add('targetCalcium', targetCalcium)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IllnessesRecordBuilder
    implements Builder<IllnessesRecord, IllnessesRecordBuilder> {
  _$IllnessesRecord? _$v;

  String? _illness;
  String? get illness => _$this._illness;
  set illness(String? illness) => _$this._illness = illness;

  int? _targetSugar;
  int? get targetSugar => _$this._targetSugar;
  set targetSugar(int? targetSugar) => _$this._targetSugar = targetSugar;

  int? _targetSodium;
  int? get targetSodium => _$this._targetSodium;
  set targetSodium(int? targetSodium) => _$this._targetSodium = targetSodium;

  int? _targetSaturatedFat;
  int? get targetSaturatedFat => _$this._targetSaturatedFat;
  set targetSaturatedFat(int? targetSaturatedFat) =>
      _$this._targetSaturatedFat = targetSaturatedFat;

  double? _targetCarbohydrates;
  double? get targetCarbohydrates => _$this._targetCarbohydrates;
  set targetCarbohydrates(double? targetCarbohydrates) =>
      _$this._targetCarbohydrates = targetCarbohydrates;

  double? _targetProtein;
  double? get targetProtein => _$this._targetProtein;
  set targetProtein(double? targetProtein) =>
      _$this._targetProtein = targetProtein;

  double? _targetFiber;
  double? get targetFiber => _$this._targetFiber;
  set targetFiber(double? targetFiber) => _$this._targetFiber = targetFiber;

  double? _targetPotassium;
  double? get targetPotassium => _$this._targetPotassium;
  set targetPotassium(double? targetPotassium) =>
      _$this._targetPotassium = targetPotassium;

  double? _targetMagnesium;
  double? get targetMagnesium => _$this._targetMagnesium;
  set targetMagnesium(double? targetMagnesium) =>
      _$this._targetMagnesium = targetMagnesium;

  double? _targetCalcium;
  double? get targetCalcium => _$this._targetCalcium;
  set targetCalcium(double? targetCalcium) =>
      _$this._targetCalcium = targetCalcium;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IllnessesRecordBuilder() {
    IllnessesRecord._initializeBuilder(this);
  }

  IllnessesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _illness = $v.illness;
      _targetSugar = $v.targetSugar;
      _targetSodium = $v.targetSodium;
      _targetSaturatedFat = $v.targetSaturatedFat;
      _targetCarbohydrates = $v.targetCarbohydrates;
      _targetProtein = $v.targetProtein;
      _targetFiber = $v.targetFiber;
      _targetPotassium = $v.targetPotassium;
      _targetMagnesium = $v.targetMagnesium;
      _targetCalcium = $v.targetCalcium;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IllnessesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IllnessesRecord;
  }

  @override
  void update(void Function(IllnessesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IllnessesRecord build() => _build();

  _$IllnessesRecord _build() {
    final _$result = _$v ??
        new _$IllnessesRecord._(
            illness: illness,
            targetSugar: targetSugar,
            targetSodium: targetSodium,
            targetSaturatedFat: targetSaturatedFat,
            targetCarbohydrates: targetCarbohydrates,
            targetProtein: targetProtein,
            targetFiber: targetFiber,
            targetPotassium: targetPotassium,
            targetMagnesium: targetMagnesium,
            targetCalcium: targetCalcium,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

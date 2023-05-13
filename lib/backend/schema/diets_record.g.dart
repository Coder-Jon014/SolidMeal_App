// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DietsRecord> _$dietsRecordSerializer = new _$DietsRecordSerializer();

class _$DietsRecordSerializer implements StructuredSerializer<DietsRecord> {
  @override
  final Iterable<Type> types = const [DietsRecord, _$DietsRecord];
  @override
  final String wireName = 'DietsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DietsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
  DietsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DietsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$DietsRecord extends DietsRecord {
  @override
  final BuiltList<String>? diets;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DietsRecord([void Function(DietsRecordBuilder)? updates]) =>
      (new DietsRecordBuilder()..update(updates))._build();

  _$DietsRecord._({this.diets, this.ffRef}) : super._();

  @override
  DietsRecord rebuild(void Function(DietsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DietsRecordBuilder toBuilder() => new DietsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DietsRecord && diets == other.diets && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, diets.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DietsRecord')
          ..add('diets', diets)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DietsRecordBuilder implements Builder<DietsRecord, DietsRecordBuilder> {
  _$DietsRecord? _$v;

  ListBuilder<String>? _diets;
  ListBuilder<String> get diets => _$this._diets ??= new ListBuilder<String>();
  set diets(ListBuilder<String>? diets) => _$this._diets = diets;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DietsRecordBuilder() {
    DietsRecord._initializeBuilder(this);
  }

  DietsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _diets = $v.diets?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DietsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DietsRecord;
  }

  @override
  void update(void Function(DietsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DietsRecord build() => _build();

  _$DietsRecord _build() {
    _$DietsRecord _$result;
    try {
      _$result =
          _$v ?? new _$DietsRecord._(diets: _diets?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'diets';
        _diets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DietsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intolerances_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IntolerancesRecord> _$intolerancesRecordSerializer =
    new _$IntolerancesRecordSerializer();

class _$IntolerancesRecordSerializer
    implements StructuredSerializer<IntolerancesRecord> {
  @override
  final Iterable<Type> types = const [IntolerancesRecord, _$IntolerancesRecord];
  @override
  final String wireName = 'IntolerancesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, IntolerancesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.intolerances;
    if (value != null) {
      result
        ..add('intolerances')
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
  IntolerancesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IntolerancesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'intolerances':
          result.intolerances.replace(serializers.deserialize(value,
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

class _$IntolerancesRecord extends IntolerancesRecord {
  @override
  final BuiltList<String>? intolerances;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IntolerancesRecord(
          [void Function(IntolerancesRecordBuilder)? updates]) =>
      (new IntolerancesRecordBuilder()..update(updates))._build();

  _$IntolerancesRecord._({this.intolerances, this.ffRef}) : super._();

  @override
  IntolerancesRecord rebuild(
          void Function(IntolerancesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntolerancesRecordBuilder toBuilder() =>
      new IntolerancesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntolerancesRecord &&
        intolerances == other.intolerances &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, intolerances.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntolerancesRecord')
          ..add('intolerances', intolerances)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IntolerancesRecordBuilder
    implements Builder<IntolerancesRecord, IntolerancesRecordBuilder> {
  _$IntolerancesRecord? _$v;

  ListBuilder<String>? _intolerances;
  ListBuilder<String> get intolerances =>
      _$this._intolerances ??= new ListBuilder<String>();
  set intolerances(ListBuilder<String>? intolerances) =>
      _$this._intolerances = intolerances;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IntolerancesRecordBuilder() {
    IntolerancesRecord._initializeBuilder(this);
  }

  IntolerancesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _intolerances = $v.intolerances?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntolerancesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IntolerancesRecord;
  }

  @override
  void update(void Function(IntolerancesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntolerancesRecord build() => _build();

  _$IntolerancesRecord _build() {
    _$IntolerancesRecord _$result;
    try {
      _$result = _$v ??
          new _$IntolerancesRecord._(
              intolerances: _intolerances?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'intolerances';
        _intolerances?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IntolerancesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

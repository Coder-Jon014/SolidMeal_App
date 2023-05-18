// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intolerance_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IntoleranceListRecord> _$intoleranceListRecordSerializer =
    new _$IntoleranceListRecordSerializer();

class _$IntoleranceListRecordSerializer
    implements StructuredSerializer<IntoleranceListRecord> {
  @override
  final Iterable<Type> types = const [
    IntoleranceListRecord,
    _$IntoleranceListRecord
  ];
  @override
  final String wireName = 'IntoleranceListRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, IntoleranceListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.intolerance;
    if (value != null) {
      result
        ..add('intolerance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.intoleranceKeyWords;
    if (value != null) {
      result
        ..add('intoleranceKeyWords')
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
  IntoleranceListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IntoleranceListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'intolerance':
          result.intolerance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'intoleranceKeyWords':
          result.intoleranceKeyWords.replace(serializers.deserialize(value,
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

class _$IntoleranceListRecord extends IntoleranceListRecord {
  @override
  final String? intolerance;
  @override
  final BuiltList<String>? intoleranceKeyWords;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IntoleranceListRecord(
          [void Function(IntoleranceListRecordBuilder)? updates]) =>
      (new IntoleranceListRecordBuilder()..update(updates))._build();

  _$IntoleranceListRecord._(
      {this.intolerance, this.intoleranceKeyWords, this.ffRef})
      : super._();

  @override
  IntoleranceListRecord rebuild(
          void Function(IntoleranceListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntoleranceListRecordBuilder toBuilder() =>
      new IntoleranceListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntoleranceListRecord &&
        intolerance == other.intolerance &&
        intoleranceKeyWords == other.intoleranceKeyWords &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, intolerance.hashCode);
    _$hash = $jc(_$hash, intoleranceKeyWords.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntoleranceListRecord')
          ..add('intolerance', intolerance)
          ..add('intoleranceKeyWords', intoleranceKeyWords)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IntoleranceListRecordBuilder
    implements Builder<IntoleranceListRecord, IntoleranceListRecordBuilder> {
  _$IntoleranceListRecord? _$v;

  String? _intolerance;
  String? get intolerance => _$this._intolerance;
  set intolerance(String? intolerance) => _$this._intolerance = intolerance;

  ListBuilder<String>? _intoleranceKeyWords;
  ListBuilder<String> get intoleranceKeyWords =>
      _$this._intoleranceKeyWords ??= new ListBuilder<String>();
  set intoleranceKeyWords(ListBuilder<String>? intoleranceKeyWords) =>
      _$this._intoleranceKeyWords = intoleranceKeyWords;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IntoleranceListRecordBuilder() {
    IntoleranceListRecord._initializeBuilder(this);
  }

  IntoleranceListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _intolerance = $v.intolerance;
      _intoleranceKeyWords = $v.intoleranceKeyWords?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntoleranceListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IntoleranceListRecord;
  }

  @override
  void update(void Function(IntoleranceListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntoleranceListRecord build() => _build();

  _$IntoleranceListRecord _build() {
    _$IntoleranceListRecord _$result;
    try {
      _$result = _$v ??
          new _$IntoleranceListRecord._(
              intolerance: intolerance,
              intoleranceKeyWords: _intoleranceKeyWords?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'intoleranceKeyWords';
        _intoleranceKeyWords?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IntoleranceListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

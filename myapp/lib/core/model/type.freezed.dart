// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Type _$TypeFromJson(Map<String, dynamic> json) {
  return _Type.fromJson(json);
}

/// @nodoc
class _$TypeTearOff {
  const _$TypeTearOff();

// ignore: unused_element
  _Type call({String name}) {
    return _Type(
      name: name,
    );
  }

// ignore: unused_element
  Type fromJson(Map<String, Object> json) {
    return Type.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Type = _$TypeTearOff();

/// @nodoc
mixin _$Type {
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TypeCopyWith<Type> get copyWith;
}

/// @nodoc
abstract class $TypeCopyWith<$Res> {
  factory $TypeCopyWith(Type value, $Res Function(Type) then) =
      _$TypeCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$TypeCopyWithImpl<$Res> implements $TypeCopyWith<$Res> {
  _$TypeCopyWithImpl(this._value, this._then);

  final Type _value;
  // ignore: unused_field
  final $Res Function(Type) _then;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$TypeCopyWith<$Res> implements $TypeCopyWith<$Res> {
  factory _$TypeCopyWith(_Type value, $Res Function(_Type) then) =
      __$TypeCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$TypeCopyWithImpl<$Res> extends _$TypeCopyWithImpl<$Res>
    implements _$TypeCopyWith<$Res> {
  __$TypeCopyWithImpl(_Type _value, $Res Function(_Type) _then)
      : super(_value, (v) => _then(v as _Type));

  @override
  _Type get _value => super._value as _Type;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_Type(
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Type implements _Type {
  const _$_Type({this.name});

  factory _$_Type.fromJson(Map<String, dynamic> json) =>
      _$_$_TypeFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Type(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Type &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$TypeCopyWith<_Type> get copyWith =>
      __$TypeCopyWithImpl<_Type>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TypeToJson(this);
  }
}

abstract class _Type implements Type {
  const factory _Type({String name}) = _$_Type;

  factory _Type.fromJson(Map<String, dynamic> json) = _$_Type.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$TypeCopyWith<_Type> get copyWith;
}

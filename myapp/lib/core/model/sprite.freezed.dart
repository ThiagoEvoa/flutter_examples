// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sprite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Sprite _$SpriteFromJson(Map<String, dynamic> json) {
  return _Sprite.fromJson(json);
}

/// @nodoc
class _$SpriteTearOff {
  const _$SpriteTearOff();

// ignore: unused_element
  _Sprite call({@JsonKey(name: 'front_default') String image}) {
    return _Sprite(
      image: image,
    );
  }

// ignore: unused_element
  Sprite fromJson(Map<String, Object> json) {
    return Sprite.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Sprite = _$SpriteTearOff();

/// @nodoc
mixin _$Sprite {
  @JsonKey(name: 'front_default')
  String get image;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SpriteCopyWith<Sprite> get copyWith;
}

/// @nodoc
abstract class $SpriteCopyWith<$Res> {
  factory $SpriteCopyWith(Sprite value, $Res Function(Sprite) then) =
      _$SpriteCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'front_default') String image});
}

/// @nodoc
class _$SpriteCopyWithImpl<$Res> implements $SpriteCopyWith<$Res> {
  _$SpriteCopyWithImpl(this._value, this._then);

  final Sprite _value;
  // ignore: unused_field
  final $Res Function(Sprite) _then;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

/// @nodoc
abstract class _$SpriteCopyWith<$Res> implements $SpriteCopyWith<$Res> {
  factory _$SpriteCopyWith(_Sprite value, $Res Function(_Sprite) then) =
      __$SpriteCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'front_default') String image});
}

/// @nodoc
class __$SpriteCopyWithImpl<$Res> extends _$SpriteCopyWithImpl<$Res>
    implements _$SpriteCopyWith<$Res> {
  __$SpriteCopyWithImpl(_Sprite _value, $Res Function(_Sprite) _then)
      : super(_value, (v) => _then(v as _Sprite));

  @override
  _Sprite get _value => super._value as _Sprite;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_Sprite(
      image: image == freezed ? _value.image : image as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Sprite implements _Sprite {
  const _$_Sprite({@JsonKey(name: 'front_default') this.image});

  factory _$_Sprite.fromJson(Map<String, dynamic> json) =>
      _$_$_SpriteFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String image;

  @override
  String toString() {
    return 'Sprite(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sprite &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$SpriteCopyWith<_Sprite> get copyWith =>
      __$SpriteCopyWithImpl<_Sprite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpriteToJson(this);
  }
}

abstract class _Sprite implements Sprite {
  const factory _Sprite({@JsonKey(name: 'front_default') String image}) =
      _$_Sprite;

  factory _Sprite.fromJson(Map<String, dynamic> json) = _$_Sprite.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String get image;
  @override
  @JsonKey(ignore: true)
  _$SpriteCopyWith<_Sprite> get copyWith;
}

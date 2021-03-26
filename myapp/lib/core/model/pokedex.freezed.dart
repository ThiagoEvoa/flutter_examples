// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pokedex.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Pokedex _$PokedexFromJson(Map<String, dynamic> json) {
  return _Pokedex.fromJson(json);
}

/// @nodoc
class _$PokedexTearOff {
  const _$PokedexTearOff();

// ignore: unused_element
  _Pokedex call(
      {int count, String next, String previous, List<Pokemon> results}) {
    return _Pokedex(
      count: count,
      next: next,
      previous: previous,
      results: results,
    );
  }

// ignore: unused_element
  Pokedex fromJson(Map<String, Object> json) {
    return Pokedex.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Pokedex = _$PokedexTearOff();

/// @nodoc
mixin _$Pokedex {
  int get count;
  String get next;
  String get previous;
  List<Pokemon> get results;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PokedexCopyWith<Pokedex> get copyWith;
}

/// @nodoc
abstract class $PokedexCopyWith<$Res> {
  factory $PokedexCopyWith(Pokedex value, $Res Function(Pokedex) then) =
      _$PokedexCopyWithImpl<$Res>;
  $Res call({int count, String next, String previous, List<Pokemon> results});
}

/// @nodoc
class _$PokedexCopyWithImpl<$Res> implements $PokedexCopyWith<$Res> {
  _$PokedexCopyWithImpl(this._value, this._then);

  final Pokedex _value;
  // ignore: unused_field
  final $Res Function(Pokedex) _then;

  @override
  $Res call({
    Object count = freezed,
    Object next = freezed,
    Object previous = freezed,
    Object results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed ? _value.count : count as int,
      next: next == freezed ? _value.next : next as String,
      previous: previous == freezed ? _value.previous : previous as String,
      results: results == freezed ? _value.results : results as List<Pokemon>,
    ));
  }
}

/// @nodoc
abstract class _$PokedexCopyWith<$Res> implements $PokedexCopyWith<$Res> {
  factory _$PokedexCopyWith(_Pokedex value, $Res Function(_Pokedex) then) =
      __$PokedexCopyWithImpl<$Res>;
  @override
  $Res call({int count, String next, String previous, List<Pokemon> results});
}

/// @nodoc
class __$PokedexCopyWithImpl<$Res> extends _$PokedexCopyWithImpl<$Res>
    implements _$PokedexCopyWith<$Res> {
  __$PokedexCopyWithImpl(_Pokedex _value, $Res Function(_Pokedex) _then)
      : super(_value, (v) => _then(v as _Pokedex));

  @override
  _Pokedex get _value => super._value as _Pokedex;

  @override
  $Res call({
    Object count = freezed,
    Object next = freezed,
    Object previous = freezed,
    Object results = freezed,
  }) {
    return _then(_Pokedex(
      count: count == freezed ? _value.count : count as int,
      next: next == freezed ? _value.next : next as String,
      previous: previous == freezed ? _value.previous : previous as String,
      results: results == freezed ? _value.results : results as List<Pokemon>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Pokedex implements _Pokedex {
  const _$_Pokedex({this.count, this.next, this.previous, this.results});

  factory _$_Pokedex.fromJson(Map<String, dynamic> json) =>
      _$_$_PokedexFromJson(json);

  @override
  final int count;
  @override
  final String next;
  @override
  final String previous;
  @override
  final List<Pokemon> results;

  @override
  String toString() {
    return 'Pokedex(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pokedex &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.next, next) ||
                const DeepCollectionEquality().equals(other.next, next)) &&
            (identical(other.previous, previous) ||
                const DeepCollectionEquality()
                    .equals(other.previous, previous)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(next) ^
      const DeepCollectionEquality().hash(previous) ^
      const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$PokedexCopyWith<_Pokedex> get copyWith =>
      __$PokedexCopyWithImpl<_Pokedex>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PokedexToJson(this);
  }
}

abstract class _Pokedex implements Pokedex {
  const factory _Pokedex(
      {int count,
      String next,
      String previous,
      List<Pokemon> results}) = _$_Pokedex;

  factory _Pokedex.fromJson(Map<String, dynamic> json) = _$_Pokedex.fromJson;

  @override
  int get count;
  @override
  String get next;
  @override
  String get previous;
  @override
  List<Pokemon> get results;
  @override
  @JsonKey(ignore: true)
  _$PokedexCopyWith<_Pokedex> get copyWith;
}

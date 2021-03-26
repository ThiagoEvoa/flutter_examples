import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.freezed.dart';
part 'type.g.dart';

@freezed
abstract class Type with _$Type {
  const factory Type({
    String name,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  factory Type.initialState() => Type(name: '');
}

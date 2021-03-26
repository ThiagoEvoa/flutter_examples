import 'package:freezed_annotation/freezed_annotation.dart';

part 'sprite.freezed.dart';
part 'sprite.g.dart';

@freezed
abstract class Sprite with _$Sprite {
  const factory Sprite({
    @JsonKey(name: 'front_default') String image,
  }) = _Sprite;

  factory Sprite.fromJson(Map<String, dynamic> json) => _$SpriteFromJson(json);

  factory Sprite.initialState() => Sprite(
    image: '',
  );
}

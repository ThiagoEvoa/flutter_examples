import 'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address{
  const factory Address({String street}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

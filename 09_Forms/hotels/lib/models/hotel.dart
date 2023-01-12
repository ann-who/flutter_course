import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class Hotel {
  final String uuid;
  final String name;
  final String poster;
  final Address? address;
  final double? rating;
  final Services? services;
  final List<String>? photos;

  Hotel({
    required this.uuid,
    required this.name,
    required this.poster,
    this.rating,
    this.address,
    this.services,
    this.photos,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Address {
  final String? country;
  final String? city;
  final String? street;

  Address({
    this.country,
    this.city,
    this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Services {
  final List<String>? free;
  final List<String>? paid;

  Services({
    this.free,
    this.paid,
  });

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}

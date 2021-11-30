// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      services: json['services'] == null
          ? null
          : Services.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address?.toJson(),
      'rating': instance.rating,
      'services': instance.services?.toJson(),
      'photos': instance.photos,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      country: json['country'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      free: (json['free'] as List<dynamic>?)?.map((e) => e as String).toList(),
      paid: (json['paid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };

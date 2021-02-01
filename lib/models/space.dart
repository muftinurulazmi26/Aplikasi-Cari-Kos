import 'dart:convert';

class Space {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final String city;
  final String country;
  final int rating;
  final String address;
  final String phone;
  final String mapUrl;
  final List photos;
  final int numberOfKitchens;
  final int numberOfBadrroms;
  final int numberOfCupboards;


  Space({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.city,
    this.country,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchens,
    this.numberOfBadrroms,
    this.numberOfCupboards,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'price': price,
      'city': city,
      'country': country,
      'rating': rating,
      'address': address,
      'phone': phone,
      'map_url': mapUrl,
      'photos': photos,
      'number_of_kitchens': numberOfKitchens,
      'number_of_bedrooms': numberOfBadrroms,
      'number_of_cupboards': numberOfCupboards,
    };
  }

  factory Space.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Space(
      id: map['id'],
      name: map['name'],
      imageUrl: map['image_url'],
      price: map['price'],
      city: map['city'],
      country: map['country'],
      rating: map['rating'],
      address: map['address'],
      phone: map['phone'],
      mapUrl: map['map_url'],
      photos: List.from(map['photos']),
      numberOfKitchens: map['number_of_kitchens'],
      numberOfBadrroms: map['number_of_bedrooms'],
      numberOfCupboards: map['number_of_cupboards'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Space.fromJson(String source) => Space.fromMap(json.decode(source));
}

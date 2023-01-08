class Address {
  final String address;
  final String city;
  final double lat;
  final double lng;
  final String postalCode;
  final String state;

  Address(
    this.address,
    this.city,
    this.lat,
    this.lng,
    this.postalCode,
    this.state,
  );

  Address.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        city = json['city'],
        lat = json['coordinates'] != null ? json['coordinates']['lat'] : json['lat'],
        lng = json['coordinates'] != null ? json['coordinates']['lng'] : json['lng'],
        postalCode = json['postalCode'],
        state = json['state'];

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'lat': lat,
      'lng': lng,
      'postalCode': postalCode,
      'state': state,
    };
  }
}

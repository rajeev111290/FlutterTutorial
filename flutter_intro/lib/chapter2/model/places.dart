class Place {
  String name;
  String address;
  int rating;
  String icon;

  Place(this.name, this.address, this.rating, this.icon);

  @override
  String toString() {
    return 'Places{name: $name, address: $address, rating: $rating}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Place && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => address.hashCode;

  Place.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        rating =
            jsonMap['rating'] == null ? 0.toInt() : jsonMap['rating'].toInt(),
        address = jsonMap['vicinity'],
        icon = jsonMap['icon'].toString();
}

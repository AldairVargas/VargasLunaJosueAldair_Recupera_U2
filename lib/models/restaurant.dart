class Restaurant {
  final String id;
  final String name;
  final String cuisine;
  final String address;
  final String schedule;
  final String description;
  final String imageUrl;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.address,
    required this.schedule,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      cuisine: json['cuisine'] as String,
      address: json['address'] as String,
      schedule: json['schedule'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }
}

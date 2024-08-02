// class Property {
//   final String id;
//   final String country;
//   final String city;
//   final List<String> photoUrls;
//   final String description;
//   final List<String> amenities;
//
//   Property({
//     required this.id,
//     required this.country,
//     required this.city,
//     required this.photoUrls,
//     required this.description,
//     required this.amenities,
//   });
//
//   factory Property.fromMap(Map<String, dynamic> map) {
//     return Property(
//       id: map['id'] ?? '',
//       country: map['country'] ?? '',
//       city: map['city'] ?? '',
//       photoUrls: List<String>.from(map['photoUrls'] ?? []),
//       description: map['description'] ?? '',
//       amenities: List<String>.from(map['amenities'] ?? []),
//     );
//   }
// }
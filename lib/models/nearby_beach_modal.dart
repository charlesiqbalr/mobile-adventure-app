import 'dart:convert';
import 'package:http/http.dart' as http;

class NearbyBeachModal {
  final String image;
  final String name;
  final String duration;
  final String location;
  final String rating;
  final String distance;
  final String description;

  NearbyBeachModal({
    required this.image,
    required this.name,
    required this.duration,
    required this.location,
    required this.rating,
    required this.distance,
    required this.description,
  });
}

Future<List<NearbyBeachModal>> fetchNearbyBeachData() async {
  final response = await http.get(Uri.parse(
'https://wisataapi-39048-default-rtdb.firebaseio.com/wisata/pantai/dekat.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<NearbyBeachModal> beachList = [];

    data.forEach((key, value) {
      beachList.add(NearbyBeachModal(
        image: value['image'],
        name: value['name'],
        duration: value[
            'duration'], 
        location: value['location'],
        rating: value['rating'],
        distance: value['distance'],
        description: value['description'],
      ));
    });

    return beachList;
  } else {
    throw Exception('Failed to load beach data');
  }
}

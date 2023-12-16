import 'dart:convert';
import 'package:http/http.dart' as http;

class NearbyMountainModal {
  final String image;
  final String name;
  final String duration;
  final String location;
  final String rating;
  final String elevation;
  final String description;

  NearbyMountainModal({
    required this.image,
    required this.name,
    required this.duration,
    required this.location,
    required this.rating,
    required this.elevation,
    required this.description,
  });
}

Future<List<NearbyMountainModal>> fetchNearbyMountainData() async {
  final response = await http.get(Uri.parse(
      'https://wisataapi-39048-default-rtdb.firebaseio.com/wisata/gunung/dekat.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<NearbyMountainModal> mountainList = [];

    data.forEach((key, value) {
      mountainList.add(NearbyMountainModal(
        image: value['image'],
        name: value['name'],
        duration: value[
            'duration'], // You may need to adjust this based on your API response
        location: value['location'],
        rating: value['rating'],
        elevation: value['elevation'],
        description: value['description'],
      ));
    });

    return mountainList;
  } else {
    throw Exception('Failed to load mountain data');
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class BeachModal {
  final String image;
  final String name;
  final String duration;
  final String rating;
  final String location;
  final String description;
  BeachModal({
    required this.image,
    required this.name,
    required this.duration,
    required this.rating,
    required this.location,
    required this.description,
  });
}

Future<List<BeachModal>> fetchBeachData() async {
  final response = await http.get(Uri.parse(
      'https://wisataapi-39048-default-rtdb.firebaseio.com/wisata/pantai/favorit.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<BeachModal> beachList = [];

    data.forEach((key, value) {
      beachList.add(BeachModal(
        image: value['image'],
        name: value['name'],
        duration: value['duration'],
        location: value['location'],
        rating: value['rating'],
        description: value['description'],
      ));
    });

    return beachList;
  } else {
    throw Exception('Failed to load beach data');
  }
}

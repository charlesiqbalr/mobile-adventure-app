import 'dart:convert';
import 'package:http/http.dart' as http;

class MountainModal {
  final String image;
  final String name;
  final String duration;
  final String rating;
  final String location;
  final String description;

  MountainModal({
    required this.image,
    required this.name,
    required this.duration,
    required this.rating,
    required this.location,
    required this.description,
  });
}

Future<List<MountainModal>> fetchMountainData() async {
  final response = await http.get(Uri.parse(
      'https://wisataapi-39048-default-rtdb.firebaseio.com/wisata/gunung/favorit.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<MountainModal> mountainList = [];

    data.forEach((key, value) {
      mountainList.add(MountainModal(
        image: value['image'],
        name: value['name'],
        duration: value['duration'],
        location: value['location'],
        rating: value['rating'],
        description: value['description'],
      ));
    });

    return mountainList;
  } else {
    throw Exception('Failed to load mountain data');
  }
}

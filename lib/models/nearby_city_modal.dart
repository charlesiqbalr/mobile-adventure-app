import 'dart:convert';
import 'package:http/http.dart' as http;

class NearbyCityModal {
  final String image;
  final String name;
  final String duration;
  final String location;
  final String rating;
  final String distance;
  final String description;

  NearbyCityModal({
    required this.image,
    required this.name,
    required this.duration,
    required this.location,
    required this.rating,
    required this.distance,
    required this.description,
  });
}

Future<List<NearbyCityModal>> fetchNearbyCityData() async {
  final response = await http.get(Uri.parse(
      'https://wisataapi-39048-default-rtdb.firebaseio.com/wisata/kota/dekat.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<NearbyCityModal> cityList = [];

    data.forEach((key, value) {
      cityList.add(NearbyCityModal(
        image: value['image'],
        name: value['name'],
        duration: value[
            'duration'], // You may need to adjust this based on your API response
        location: value['location'],
        rating: value['rating'],
        distance: value['distance'],
        description: value['description'],
      ));
    });

    return cityList;
  } else {
    throw Exception('Failed to load city data');
  }
}

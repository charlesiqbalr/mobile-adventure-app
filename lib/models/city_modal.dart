import 'dart:convert';
import 'package:http/http.dart' as http;

class CityModal {
  final String image;
  final String name;
  final String duration;
  final String rating;
  final String location;
  final String description;
  CityModal({
    required this.image,
    required this.name,
    required this.duration,
    required this.rating,
    required this.location,
    required this.description,
  });
}

Future<List<CityModal>> fetchCityData() async {
  final response = await http.get(Uri.parse(
      'https://wisataapi-39048-default-rtdb.firebaseio.com/wisata/kota/favorit.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<CityModal> cityList = [];

    data.forEach((key, value) {
      cityList.add(CityModal(
        image: value['image'],
        name: value['name'],
        duration: value['duration'],
        location: value['location'],
        rating: value['rating'],
        description: value['description'],
      ));
    });

    return cityList;
  } else {
    throw Exception('Failed to load city data');
  }
}

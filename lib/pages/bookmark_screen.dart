// ignore_for_file: prefer_const_constructors

import 'package:adventure_app/models/nearby_beach_modal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookmarkScreen extends StatelessWidget {
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
          duration: value['duration'],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
      ),
      body: FutureBuilder(
        future: fetchNearbyBeachData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<NearbyBeachModal> beachList =
                snapshot.data as List<NearbyBeachModal>;
            if (beachList.isEmpty) {
              return Center(child: Text('No data available'));
            }

            return ListView.builder(
              itemCount: beachList.length,
              itemBuilder: (context, index) {
                NearbyBeachModal beach = beachList[index];
                return GestureDetector(
                  onTap: () {
                    // Tambahkan logika ketika item di-klik
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.network(
                          beach.image,
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            beach.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

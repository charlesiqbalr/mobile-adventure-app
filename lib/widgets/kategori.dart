// ignore_for_file: prefer_const_constructors

import 'package:adventure_app/pages/home_beach.dart';
import 'package:adventure_app/pages/home_city.dart';
import 'package:adventure_app/pages/home_mountain.dart';
import 'package:flutter/material.dart';
import '../models/categories_modal.dart';

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Tambahkan logika untuk mengarahkan pengguna ke layar yang sesuai
              if (touristPlaces[index].name == "Beach") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeBeach()),
                );
              } else if (touristPlaces[index].name == "City") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeCity()),
                );
              } else if (touristPlaces[index].name == "Mountain") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
              // Tambahkan logika lainnya untuk item lain jika diperlukan.
            },
            child: Chip(
              label: Text(touristPlaces[index].name),
              avatar: CircleAvatar(
                backgroundImage: AssetImage(touristPlaces[index].image),
              ),
              backgroundColor: Colors.white,
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.only(right: 10)),
        itemCount: touristPlaces.length,
      ),
    );
  }
}

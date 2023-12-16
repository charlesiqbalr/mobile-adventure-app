// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:adventure_app/models/city_modal.dart';
import 'package:adventure_app/pages/bookmark_screen.dart';
import 'package:adventure_app/pages/home_mountain.dart';
import 'package:adventure_app/pages/profile_screen.dart';
import 'package:adventure_app/widgets/city.dart';
import 'package:adventure_app/widgets/kategori.dart';
import 'package:adventure_app/widgets/nearby_city.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/maps.dart';

class HomeCity extends StatelessWidget {
  const HomeCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommended City',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Explore Your Destination',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: const [
          CustomIconButton(
            icon: Icon(Ionicons.search_outline),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 12),
            child: CustomIconButton(
              icon: Icon(Ionicons.notifications_outline),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          //LOCATION CARD
          LocationCard(),
          SizedBox(
            height: 15,
          ),
          Text(
            "Categories",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          //TOURIST PLACE
          TouristPlaces(),

          //RECOMENDATION PLACE

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recomendation City",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          FutureBuilder(
            future: fetchCityData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                return City(
                  citys: snapshot.data!,
                  city: [],
                );
              }
            },
          ),

          //NEARBY FROM YOU
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby City From You",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(onPressed: () {}, child: const Text("View All"))
            ],
          ),

          const SizedBox(height: 10),
          const NearbyCity(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Person",
          ),
        ],
        currentIndex: 0, // Ganti indeks sesuai tampilan beranda
        onTap: (index) =>
            _onItemTapped(context, index), // Panggil fungsi _onItemTapped
      ),
    );
  }

  // Fungsi ini menentukan logika navigasi berdasarkan indeks item yang diklik
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookmarkScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }
}

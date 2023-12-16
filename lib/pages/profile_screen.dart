// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:adventure_app/pages/update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/wallpaper.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          ),

          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // IMAGE
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/charlez.jpg"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 17.5,
                          backgroundColor: Colors.blue,
                          child: const Icon(
                            LineAwesomeIcons.alternate_pencil,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Charles Iqbal Rizanta",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors
                              .white, // Mengganti warna teks menjadi putih
                        ),
                  ),
                  Text(
                    "New Member",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors
                              .white, // Mengganti warna teks menjadi putih
                        ),
                  ),

                  // Additional Information
                  const SizedBox(height: 20),
                  _buildProfileInfo("Email", LineAwesomeIcons.envelope,
                      "charles@example.com"),
                  _buildProfileInfo("Address", LineAwesomeIcons.map_marker,
                      "123 Main Street"),
                  _buildProfileInfo(
                      "Postal Code", LineAwesomeIcons.location_arrow, "12345"),
                  _buildProfileInfo("Phone Number", LineAwesomeIcons.phone,
                      "+1 234-567-8901"),
                  _buildProfileInfo(
                      "Country", LineAwesomeIcons.globe, "United States"),

                  const SizedBox(height: 20),

                  // BUTTON
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the update profile screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(LineAwesomeIcons.edit, color: Colors.black),
                        const SizedBox(width: 15),
                        const Text("Edit",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  // MENU
                  _buildProfileMenu("Settings", LineAwesomeIcons.cog, () {}),
                  _buildProfileMenu(
                      "Billing Details", LineAwesomeIcons.wallet, () {}),
                  _buildProfileMenu(
                      "User Management", LineAwesomeIcons.user_check, () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  _buildProfileMenu(
                      "Information", LineAwesomeIcons.info, () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(String title, IconData icon, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon,
                  color: Colors.white), // Mengganti warna ikon menjadi putih
              const SizedBox(width: 16),
              Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
          Text(value,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildProfileMenu(String title, IconData icon, Function() onPress) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber,
                  child: Icon(icon, color: Colors.white),
                ),
                const SizedBox(width: 16.0),
                Text(title, style: TextStyle(color: Colors.white)),
              ],
            ),
            const Icon(LineAwesomeIcons.angle_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

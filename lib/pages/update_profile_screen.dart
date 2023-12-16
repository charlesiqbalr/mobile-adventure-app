// ignore_for_file: unnecessary_const, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(LineAwesomeIcons.angle_left,
              color: Colors.white), // Mengganti warna ikon menjadi putih
        ),
        title: const Text("Edit Profile",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white)), // Mengganti warna teks menjadi putih
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/bira.jpg"), // Ganti dengan path ke gambar latar belakang Anda
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              /// -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          const Image(image: AssetImage("assets/charlez.jpg")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                      child: const Icon(LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              /// -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                          color: Colors
                              .white), // Mengganti warna teks input menjadi putih
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(LineAwesomeIcons.user),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(
                          color: Colors
                              .white), // Mengganti warna teks input menjadi putih
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(
                          color: Colors
                              .white), // Mengganti warna teks input menjadi putih
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Icon(LineAwesomeIcons.phone),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                          color: Colors
                              .white), // Mengganti warna teks input menjadi putih
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                          icon: const Icon(LineAwesomeIcons.eye_slash),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text("Save Changes",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "Joined",
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                text: " at 12-Jan-2022",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            primary: Colors.red,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

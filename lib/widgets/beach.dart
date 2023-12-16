// ignore_for_file: prefer_const_constructors, duplicate_import

import 'package:adventure_app/models/beach_modal.dart';
import 'package:adventure_app/pages/beach_detail.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../models/beach_modal.dart';

class Beach extends StatelessWidget {
  const Beach(
      {Key? key,
      required List<BeachModal> beachs,
      required List<BeachModal> beach})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: FutureBuilder<List<BeachModal>>(
        future: fetchBeachData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final beach = snapshot.data![index];
                return SizedBox(
                  width: 220,
                  child: Card(
                    elevation: 0.4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BeachDetailsPage(
                              beachDetail: beach,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                beach.image,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  beach
                                      .name, // Tampilkan Nama Gunung Yang Sesuai
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.star, // Menampilkan Bintang
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                Text(
                                  beach.rating
                                      .toString(), // Tampilkan rating yang sesuai
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 19),
                            Row(
                              children: [
                                Icon(
                                  Ionicons.location,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  beach
                                      .location, // Tampilkan lokasi yang sesuai
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}

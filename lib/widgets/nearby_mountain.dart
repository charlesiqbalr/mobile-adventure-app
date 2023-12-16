// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, library_private_types_in_public_api, avoid_print

import 'package:adventure_app/models/nearby_mountain_modal.dart';
import 'package:adventure_app/pages/nearby_mountain_detail.dart';
import 'package:flutter/material.dart';

class NearbyMountain extends StatefulWidget {
  const NearbyMountain({Key? key}) : super(key: key);

  @override
  _NearbyMountainState createState() => _NearbyMountainState();
}

class _NearbyMountainState extends State<NearbyMountain> {
  late List<NearbyMountainModal> nearbyMountain;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      List<NearbyMountainModal> data =
          await fetchNearbyMountainData(); //Mengambil Dari Modal
      setState(() {
        nearbyMountain = data;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyMountain.length, (index) {
        final nm = nearbyMountain[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 135,
            width: double.maxFinite,
            child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NearbyMountainDetail(
                        nearbyMountain: nm,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          nm.image, // Use Image.network to load the image from a URL
                          height: double.maxFinite,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nm.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  color: Colors
                                      .green, // Customize the color as needed
                                  size: 16,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  nm.elevation,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors
                                      .blue, // Customize the color as needed
                                  size: 16,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  nm.duration,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                Text(
                                  nm.rating,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  nm.location,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

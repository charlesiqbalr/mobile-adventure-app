// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, non_constant_identifier_names, library_private_types_in_public_api, avoid_print

import 'package:adventure_app/models/nearby_beach_modal.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../pages/nearby_beach_detail.dart';

class NearbyBeach extends StatefulWidget {
  const NearbyBeach({Key? key}) : super(key: key);

  @override
  _NearbyBeachState createState() => _NearbyBeachState();
}

class _NearbyBeachState extends State<NearbyBeach> {
  late List<NearbyBeachModal> nearbyBeach;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      List<NearbyBeachModal> data =
          await fetchNearbyBeachData(); //Mengambil Dari Modal
      setState(() {
        nearbyBeach = data;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyBeach.length, (index) {
        final nb = nearbyBeach[index];
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
                      builder: (context) => NearbyBeachDetail(
                        nearbyBeach: nb,
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
                          nb.image, // Use Image.network to load the image from a URL
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
                              nb.name,
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
                                  nb.distance,
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
                                  nb.duration,
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
                                  nb.rating,
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
                                  nb.location,
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

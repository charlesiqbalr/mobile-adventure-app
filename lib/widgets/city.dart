// ignore_for_file: prefer_const_constructors, duplicate_import, unused_local_variable
import 'package:adventure_app/models/city_modal.dart';
import 'package:adventure_app/pages/city_detail.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class City extends StatelessWidget {
  const City(
      {Key? key, required List<CityModal> citys, required List<CityModal> city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: FutureBuilder<List<CityModal>>(
        future: fetchCityData(),
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
                final city = snapshot.data![index];
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
                            builder: (context) => CityDetail(
                              cityDetail: city,
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
                                city.image,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  city.name, // Tampilkan Nama Pantai Yang Sesuai
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
                                  city.rating
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
                                  city.location, // Tampilkan lokasi yang sesuai
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

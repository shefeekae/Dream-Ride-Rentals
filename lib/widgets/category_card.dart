import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/all_cars_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.allCars,
    required this.index,
  }) : super(key: key);

  final List<AllCarsModel> allCars;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(
            flex: 1,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(allCars[index].image.url)),
          const Spacer(
            flex: 1,
          ),
          Text(
            allCars[index].name,
            style: GoogleFonts.sansita(fontSize: 18),
          ),
          Row(
            children: [
              Text(
                "₹ ${allCars[index].rentPerHour.toString()} per hour",
                style: GoogleFonts.sansita(),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:dream_ride_rentals/providers/all_cars_provider.dart';
import 'package:dream_ride_rentals/widgets/category_card.dart';
import 'package:dream_ride_rentals/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, required this.allCars});

  final List<AllCarsModel> allCars;
  final TextEditingController searchController = TextEditingController();

  void _runFilter(String enteredKeyword, BuildContext context) {
    List<AllCarsModel> results = [];
    results = allCars
        .where((AllCarsModel item) =>
            item.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList();

    Provider.of<AllCarsProvider>(context, listen: false).setFoundCars(results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    searchController: searchController,
                    onChanged: (value) {
                      _runFilter(value, context);
                    },
                    autofocus: true,
                    readOnly: false,
                  ),
                ),
                IconButton(
                    onPressed: () => searchController.text.isEmpty
                        ? Navigator.of(context).pop()
                        : searchController.text = '',
                    icon: const Icon(Icons.close))
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.9,
                    crossAxisCount: 2),
                itemCount:
                    Provider.of<AllCarsProvider>(context).foundCars.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    index: index,
                    allCars: Provider.of<AllCarsProvider>(context).foundCars,
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

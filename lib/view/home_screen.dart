import 'package:dream_ride_rentals/controller/getAllCars_controllers.dart';
import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:dream_ride_rentals/widgets/category_card.dart';
import 'package:dream_ride_rentals/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

AuthService authService = AuthService();

class _HomeScreenState extends State<HomeScreen> {
  List<AllCarsModel> allCars = [];

  GetAllCarsController getAllCarsController = GetAllCarsController();

  void navigateToSearchScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/search', arguments: allCars);
  }

  getAllCars() async {
    allCars = await getAllCarsController.getAllCarsController(context);
  }

  // TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Page"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           authService.signOut(context);
      //         },
      //         icon: const Icon(Icons.logout))
      //   ],
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              SearchTextField(
                onTap: () => navigateToSearchScreen(context),
                autofocus: false,
                readOnly: true,
              ),
              // Container(
              //   height: 52,
              //   width: 52,
              //   decoration: const BoxDecoration(),
              // ),
              Expanded(
                child: FutureBuilder(
                    future: getAllCars(),
                    builder: (context, listOfCars) {
                      if (listOfCars.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 0.9,
                                  crossAxisCount: 2),
                          itemCount: allCars.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              index: index,
                              allCars: allCars,
                            );
                          },
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

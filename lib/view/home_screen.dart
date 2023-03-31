import 'package:dream_ride_rentals/controller/getAllCars_controllers.dart';
import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';
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

  getAllCars() async {
    allCars = await getAllCarsController.getAllCarsController(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                authService.signOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: getAllCars(),
                        builder: (context, listOfCars) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: 0.85,
                                    crossAxisCount: 2),
                            itemCount: allCars.length,
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                index: index,
                                allCars: allCars,
                              );
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Column(
        children: <Widget>[
          const Spacer(
            flex: 2,
          ),
          Image.network(allCars[index].image.url),
          const Spacer(
            flex: 2,
          ),
          // Text(
          //   allCars[index].name,
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}

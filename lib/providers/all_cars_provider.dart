import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:flutter/material.dart';

class AllCarsProvider extends ChangeNotifier {
  List<AllCarsModel> _foundCars = [];

  List<AllCarsModel> get foundCars => _foundCars;

  setFoundCars(List<AllCarsModel> foundCars) {
    _foundCars = foundCars;
    notifyListeners();
  }
}

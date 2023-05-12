import 'package:flutter/material.dart';
import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';

class GetAllCarsController {
  AuthService auth = AuthService();

  Future<List<AllCarsModel>> getAllCarsController(BuildContext context) async {
    // DateTime time = DateTime.parse('');
    // // BookedTimeSlot slot = BookedTimeSlot(from: '', to: '', id: '');
    // List<BookedTimeSlot> bookedSlots = [];
    // ImageModel image = ImageModel(publicId: '', url: '');
    // AllCarsModel allCars = AllCarsModel(
    //     image: image,
    //     id: '',
    //     name: '',
    //     description: '',
    //     rentPerHour: 0,
    //     capacity: 0,
    //     fuelType: '',
    //     deleted: false,
    //     bookedTimeSlots: bookedSlots,
    //     createdAt: time,
    //     updatedAt: time,
    //     v: 0);

    final carList = await auth.getAllCars(context);
    return carList;
  }
}

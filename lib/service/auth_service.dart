import 'dart:convert';
import 'dart:io';
import 'package:dream_ride_rentals/model/all_cars_model.dart';
import 'package:dream_ride_rentals/model/login_model.dart';
import 'package:dream_ride_rentals/model/register_model.dart';
import 'package:dream_ride_rentals/providers/user_provider.dart';
import 'package:dream_ride_rentals/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../model/user_model.dart';

class AuthService {
  //User Register
  Future<Register> signUpUser(
      {required Map body, required BuildContext context}) async {
    Register jsonResponse =
        Register(message: '', success: false, sessionId: '');
    try {
      const url = 'http://localhost:8080/api/v1/user/register';
      final uri = Uri.parse(url);
      final encodedBody = jsonEncode(body);
      final response = await http.post(uri,
          body: encodedBody, headers: {'Content-Type': 'application/json'});

      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            jsonResponse = registerFromJson(response.body);
            Navigator.of(context)
                .pushNamed('/otp', arguments: jsonResponse.sessionId);
          });
    } on HttpException catch (e) {
      showSnackBar(context, e.message.toString());
    }
    return jsonResponse;
  }

  // Verify Otp
  Future<void> verifyOtp({
    required BuildContext context,
    required Map body,
  }) async {
    try {
      const url = 'http://localhost:8080/api/v1/user/verify-otp';
      final uri = Uri.parse(url);
      final encodedBody = jsonEncode(body);
      final response = await http.post(uri,
          body: encodedBody, headers: {'Content-Type': 'application/json'});

      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.of(context).pushNamed('/loginOrRegister');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// User Login
  Future<Login> signInUser(
      {required BuildContext context,
      required Map body,
      required Login jsonResponse}) async {
    try {
      final navigator = Navigator.of(context);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      const url = 'http://localhost:8080/api/v1/user/login';
      final uri = Uri.parse(url);
      final encodedBody = jsonEncode(body);
      final response = await http.post(uri,
          body: encodedBody, headers: {'Content-Type': 'application/json'});

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          jsonResponse = loginFromJson(response.body);
          var storage = const FlutterSecureStorage();
          userProvider.setUserLogin(response.body);
          storage.write(key: 'token', value: jsonResponse.token);
          navigator.pushNamedAndRemoveUntil(
              '/bottomNav', (Route<dynamic> route) => false);
        },
      );
    } on HttpException catch (e) {
      showSnackBar(context, e.message.toString());
    }
    return jsonResponse;
  }

  //getallusers
  Future<User> getUserData(BuildContext context) async {
    User user = User(
        pic: '',
        isAdmin: false,
        id: '',
        name: '',
        email: '',
        password: '',
        phoneNumber: 0,
        answer: '',
        access: false,
        v: 0);

    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      var storage = const FlutterSecureStorage();
      const url = 'http://localhost:8080/api/v1/user/getUserInfo';
      String? token = await storage.read(key: 'token');

      if (token == null) {
        storage.delete(key: 'token');
      }
      final uri = Uri.parse(url);
      final userRes = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      user = userFromJson(userRes.body);
      userProvider.setUser(userRes.body);
    } catch (e) {
      showSnackBar(context, "Something went wrong");
    }
    return user;
  }

  //Sign out user
  void signOut(BuildContext context) async {
    var storage = const FlutterSecureStorage();
    storage.delete(key: 'token');
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/loginOrRegister', (route) => false);
  }

  Future<List<AllCarsModel>> getAllCars(BuildContext context) async {
    const url = "http://localhost:8080/api/v1/user/getallcars";
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    List<AllCarsModel> allCars = allCarsModelFromJson(response.body);

    return allCars;
  }
}

import 'package:dream_ride_rentals/controller/getUser_controller.dart';
import 'package:dream_ride_rentals/providers/user_provider.dart';
import 'package:dream_ride_rentals/service/auth_service.dart';
import 'package:dream_ride_rentals/view/home_screen.dart';
import 'package:dream_ride_rentals/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final AuthService authService = AuthService();
  final GetUser getUser = GetUser();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  int currentIndex = 0;

  List<Widget> screens = [const HomeScreen(), const SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.deepOrange,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      // appBar: AppBar(
      //   title: const Text("Home Page"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           setState(() {
      //             authService.signOut(context);
      //           });
      //         },
      //         icon: const Icon(Icons.logout))
      //   ],
      // ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.searchController,
    this.onChanged,
    this.onTap,
    required this.autofocus,
    required this.readOnly,
  }) : super(key: key);

  final Function(String)? onChanged;
  final Function()? onTap;
  final bool autofocus;
  final TextEditingController? searchController;
  final bool isVisible = false;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      autofocus: autofocus,
      controller: searchController,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 213, 213, 213))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)),
      ),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}

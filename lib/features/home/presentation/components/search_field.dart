import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: const Color(0xff0E162C),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff858585),
          size: 30,
        ),
        hintText: 'Search your interesting foods...',
        hintStyle: const TextStyle(color: Color(0xff858585)),
      ),
      cursorColor: const Color(0xff858585),
      style: const TextStyle(color: Color(0xff858585)),
    );
  }
}

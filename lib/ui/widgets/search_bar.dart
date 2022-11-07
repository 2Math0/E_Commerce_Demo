import 'package:flutter/material.dart';
import 'package:flutter_demo_task/ui/constants/const_styles.dart';

import '../constants/const_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            fillColor: kShadedWhiteGreyColor83,
            filled: true,
            prefixIcon: const Icon(Icons.search, color: Colors.black87),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: kGreyColor83, width: 1.0),
            ),
            hintText: 'Search in Thousand of Products',
            hintStyle: normalText));
  }
}


import 'package:flutter/material.dart';
import 'package:grad_project/core/style/app_colors.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search doctor...',
        hintStyle: const TextStyle(
          color: AppColors.lightGrayColor,
          fontSize: 12,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.lightGrayColor,
          size: 20,
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

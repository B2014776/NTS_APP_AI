import 'package:flutter/material.dart';
import '../../../../models/CategoryModel.dart';

class CategoryButtons extends StatelessWidget {
  final List<DanhMuc> categories;
  final Function(String) onCategorySelected;
  final String selectedCategoryId;

  const CategoryButtons({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () => onCategorySelected(category.id),
              style: ElevatedButton.styleFrom(
                backgroundColor: category.id == selectedCategoryId
                    ? Colors.green
                    : Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                foregroundColor: category.id == selectedCategoryId
                    ? Colors.white
                    : Colors.black,
              ),
              child: Text(category.tenDanhMuc),
            ),
          );
        }).toList(),
      ),
    );
  }
}

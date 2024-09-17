import 'package:flutter/material.dart';
import '../../../../models/CategoryModel.dart';

class CategoryButtons extends StatelessWidget {
  final List<DanhMuc> categories;
  final String selectedCategoryId;
  final Function(String) onCategorySelected;

  const CategoryButtons({
    Key? key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ElevatedButton(
              onPressed: () => onCategorySelected(category.id),
              style: ElevatedButton.styleFrom(
                backgroundColor: category.id == selectedCategoryId
                    ? Colors.green
                    : Colors.white,
                foregroundColor: category.id == selectedCategoryId
                    ? Colors.white
                    : Colors.grey,
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: category.id == selectedCategoryId
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                ),
                elevation: category.id == selectedCategoryId ? 5 : 2,
              ),
              child: Text(category.tenDanhMuc),
            ),
          );
        }).toList(),
      ),
    );
  }
}

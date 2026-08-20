import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';

class HeaderCategory extends StatefulWidget {
  const HeaderCategory({super.key});

  @override
  State<HeaderCategory> createState() => _HeaderCategoryState();
}

class _HeaderCategoryState extends State<HeaderCategory> {
  // Index de la catégorie sélectionnée par défaut ("All Categories")
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: List.generate(downloadCategories.length, (index) {
          final categoryName = downloadCategories[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(
                categoryName,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              selected: isSelected,
              selectedColor: Colors.red,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? Colors.red : Colors.redAccent,
                ),
              ),
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    selectedIndex = index;
                  });
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

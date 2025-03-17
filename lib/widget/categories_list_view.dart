import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widget/CategoryCard.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  // List of categories with their names and images
  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryName: "Business",
      image: "assets/images/business.avif",
    ),
    CategoryModel(
      categoryName: "Entertainment",
      image: "assets/images/entertaiment.avif",
    ),
    CategoryModel(
      categoryName: "Sports",
      image: "assets/images/sports.avif",
    ),
    CategoryModel(
      categoryName: "Health",
      image: "assets/images/health.avif",
    ),
    CategoryModel(
      categoryName: "Science",
      image: "assets/images/science.avif",
    ),
    CategoryModel(
      categoryName: "General",
      image: "assets/images/general.avif",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          }),
    );
  }
}

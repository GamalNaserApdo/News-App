import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category});

  CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return CategoryView(
            category: category.categoryName,
          );
        }));
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
              child: Text(
            category.categoryName,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}

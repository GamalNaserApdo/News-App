import 'package:flutter/material.dart';
import 'package:news_app/widget/bottom_navigation_bar.dart';
import 'package:news_app/widget/categories_list_view.dart';
import 'package:news_app/widget/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              // Display the list of categories
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              // Display the list of news articles
              SliverToBoxAdapter(
                child: SizedBox(height: 32), // Add spacing between widgets
              ),
              NewsListViewBuilder(
                category: "general",
              ), // Display the news list
              SliverToBoxAdapter(child: bottomNavigationBar()),
            ],
          ),
        ),
      ),
    );
  }
}

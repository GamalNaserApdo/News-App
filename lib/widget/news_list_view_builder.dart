import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widget/error_meassage.dart';
import 'package:news_app/widget/loading_widget.dart';
import 'package:news_app/widget/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getTopHeadlines(category: widget.category);
    // widget.category  de 3almha 3asha w ana fe el state mesh shayf el widget
    // 3ashan enta 3aref en el stateful ptnkasm le state we widget
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: ErrorMessage(),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 400,
                  ),
                  LoadingWidget(), // Circular loading indicator
                  SizedBox(height: 20),
                  Text("Loading..."), // Loading text
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

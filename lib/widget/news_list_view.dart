import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widget/new_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

 NewsListView({super.key , required this.articles}) ;
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate( 
              childCount: articles.length,
              (context, index) {
                return NewsTile(
                  articleModel: articles[index],
                );
              },
            ),
          );
  }
}

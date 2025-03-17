import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    required this.articleModel,
    super.key,
  });

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the article image (if available)
          _buildArticleImage(),
          const SizedBox(height: 8), // Spacing between image and text

          // Display the article title
          _buildArticleTitle(),

          const SizedBox(height: 4), // Spacing between title and subtitle

          // Display the article subtitle (if available)
          _buildArticleSubtitle(),
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    if (articleModel.image == null) return const SizedBox.shrink();

    return CachedNetworkImage(
      imageUrl: articleModel.image!,
      fit: BoxFit.cover,
      height: 150, // Optional: Set a fixed height for the image
      width: double.infinity,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildArticleTitle() {
    return Text(
      articleModel.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildArticleSubtitle() {
    if (articleModel.subtitle == null) return const SizedBox.shrink();

    return Text(
      articleModel.subtitle!,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
  }
}

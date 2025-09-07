import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/home/model/articles_list_data.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles;

  const ArticleItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        spacing: 10,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage ?? '',
            imageBuilder:
                (context, imageProvider) =>
                    Container(height: 220, width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider)
                      ),),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
          ),
          Text(
            articles.title ?? "",
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
          Row(
            children: [
              Text(
                articles.source?.name ?? "",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xFFA0A0A0),
                ),),
              Text(
                articles.publishedAt ?? "",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xFFA0A0A0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

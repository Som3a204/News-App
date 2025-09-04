import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_requests.dart';
import 'package:news_app/modules/home/model/articles_list_data.dart';
import 'package:news_app/modules/home/model/source_data.dart';
import 'package:news_app/modules/home/widgets/article_item_widget.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key, required this.sourceData});

  final SourceData sourceData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ApiRequests.getArticles(sourceData.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          List<Articles> articlesList = snapshot.data ?? [];
          return ListView.separated(
            itemBuilder: (context, index) {
              return ArticleItemWidget(articles: articlesList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
            itemCount: articlesList.length,
          );
        },
      ),
    );
  }
}

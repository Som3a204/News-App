import 'package:flutter/material.dart';
import 'package:news_app/modules/home/model/source_data.dart';
import 'package:news_app/modules/home/view_model/home_view_model.dart';
import 'package:news_app/modules/home/widgets/article_item_widget.dart';
import 'package:provider/provider.dart';

class ArticlesListView extends StatefulWidget {
  const ArticlesListView({super.key, required this.sourceData});

  final SourceData sourceData;

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getArticles(
        widget.sourceData.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<HomeViewModel>(
        builder: (context, HomeViewModel viewModel, _) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return ArticleItemWidget(articles: viewModel.articlesList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
            itemCount: viewModel.articlesList.length,
          );
        },
        /*      child: FutureBuilder(
          future: ApiRequests.getArticles(widget.sourceData.id),
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
        ),*/
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color_pallete.dart';
import 'package:news_app/modules/home/model/articles_list_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles;

  const ArticleItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        _showArticleDetails(articles, context);
      },
      child: Container(
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
              imageUrl: articles.urlToImage ?? "",
              imageBuilder:
                  (context, imageProvider) =>
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider),
                    ),
                  ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
            ),
            Text(
              articles.title ?? "",
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    articles.source?.name ?? "",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    articles.publishedAt ?? "",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showArticleDetails(Articles articles, BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: ColorPallete.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CachedNetworkImage(
                      imageUrl: articles.urlToImage ?? "",
                      imageBuilder:
                          (context, imageProvider) =>
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) => Icon(Icons.error, size: 50),
                    ),
                    Text(
                      articles.description ?? "",
                      style: Theme
                          .of(
                        context,
                      )
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                    FilledButton(
                      onPressed: () {
                        launchUrl(mode: LaunchMode.inAppWebView,
                            Uri.parse(articles.url ?? ''));
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: ColorPallete.generalTextColor,
                          foregroundColor: ColorPallete.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          )
                      ),
                      child: Text("View Full Article"),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

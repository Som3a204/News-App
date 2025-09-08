import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/core/network/api_requests.dart';
import 'package:news_app/core/theme/color_pallete.dart';
import 'package:news_app/modules/home/model/articles_list_data.dart';
import 'package:news_app/modules/home/widgets/article_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  List<Articles> articles = [];
  int maxResults = 0;
  int currentPage = 1;
  String? errorMessage = "";
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (searchController.text.isNotEmpty &&
            (maxResults > articles.length)) {
          _search();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: ColorPallete.scaffoldBackgroundColor,
            leading: SizedBox.shrink(),
            leadingWidth: 0,
            toolbarHeight: 80,
            floating: true,
            title: TextFormField(
              onFieldSubmitted: (value) {
                currentPage = 1;
                maxResults = 0;
                _search();
              },
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorPallete.generalTextColor,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: ColorPallete.generalTextColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorPallete.generalTextColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorPallete.generalTextColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorPallete.generalTextColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorPallete.generalTextColor),
                ),
              ),
            ),
          ),
          if (articles.isEmpty && errorMessage == null)
            SliverToBoxAdapter(
              child: Lottie.asset(AppAssets.emptyListAnimation),
            ),
          if (errorMessage != null)
            SliverToBoxAdapter(
              child: Text(
                errorMessage ?? '',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          if (articles.isNotEmpty)
            SliverList.separated(
              itemBuilder: (context, index) {
                if (index == articles.length) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ArticleItemWidget(articles: articles[index]);
                }
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemCount:
                  articles.length < maxResults
                      ? articles.length + 1
                      : articles.length,
            ),
        ],
      ),
    );
  }

  Future<void> _search() async {
    errorMessage = '';
    try {
      var response = await ApiRequests.searchArticles(
        searchQuery: searchController.text,
        pageNumber: currentPage,
      );
      articles.addAll(response.articles ?? []);
      maxResults = response.totalResults?.toInt() ?? 0;
      currentPage++;
    } catch (e) {
      errorMessage = e.toString();
    }
    setState(() {});
  }
}

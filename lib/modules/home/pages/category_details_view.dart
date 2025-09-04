import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_requests.dart';
import 'package:news_app/core/theme/color_pallete.dart';
import 'package:news_app/modules/home/model/category_data_model.dart';
import 'package:news_app/modules/home/model/source_data.dart';
import 'package:news_app/modules/home/pages/articles_list_view.dart';
import 'package:news_app/modules/home/widgets/tab_bar_item_widget.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.categoryDataModel});

  final CategoryDataModel categoryDataModel;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiRequests.getSources(widget.categoryDataModel.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<SourceData> sourcesList = snapshot.data ?? [];
        return Column(
          children: [
            DefaultTabController(
              length: sourcesList.length,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: ColorPallete.generalTextColor,
                tabs:
                    sourcesList.map((e) {
                      return TabBarItemWidget(
                        sourceData: e,
                        isSelected: selectedIndex == sourcesList.indexOf(e),
                      );
                    }).toList(),
              ),
            ),
            ArticlesListView(sourceData: sourcesList[selectedIndex]),
          ],
        );
      },
    );
  }
}

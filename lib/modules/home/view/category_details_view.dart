import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color_pallete.dart';
import 'package:news_app/modules/home/view/articles_list_view.dart';
import 'package:news_app/modules/home/view_model/home_view_model.dart';
import 'package:news_app/modules/home/widgets/tab_bar_item_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key});

  /*final CategoryDataModel categoryDataModel;*/

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getSources();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeViewModel viewModel, _) {
        return Column(
          children: [
            DefaultTabController(
              length: viewModel.sourcesList.length,
              child: TabBar(
                onTap: viewModel.changeTabIndex,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: ColorPallete.generalTextColor,
                tabs:
                viewModel.sourcesList.map((e) {
                  return TabBarItemWidget(
                    sourceData: e,
                    isSelected: viewModel.currentTabIndex ==
                        viewModel.sourcesList.indexOf(e),
                  );
                }).toList(),
              ),
            ),
            if(viewModel.sourcesList.isNotEmpty)
              ArticlesListView(
                  sourceData: viewModel.sourcesList[viewModel.currentTabIndex]),
          ],
        );
      },
    );
    /*return FutureBuilder(
      future: ApiRequests.getSources(widget.categoryDataModel.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<SourceData>viewModel sourcesList = snapshot.data ?? [];*/

  }
}


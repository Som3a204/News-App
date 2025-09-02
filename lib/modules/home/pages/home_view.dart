import 'package:flutter/material.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/modules/home/model/category_data_model.dart';
import 'package:news_app/modules/home/pages/custom_drawer.dart';
import 'package:news_app/modules/home/widgets/category_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryDataModel? selectedCategory;

  List<CategoryDataModel> categories = [
    CategoryDataModel(
      id: "general",
      title: "General",
      image: AppAssets.generalDark,
    ),
    CategoryDataModel(
      id: "business",
      title: "Business",
      image: AppAssets.businessDark,
    ),
    CategoryDataModel(
      id: "sports",
      title: "Sports",
      image: AppAssets.sportsDark,
    ),
    CategoryDataModel(
      id: "health",
      title: "Health",
      image: AppAssets.healthDark,
    ),
    CategoryDataModel(
      id: "science",
      title: "Science",
      image: AppAssets.scienceDark,
    ),
    CategoryDataModel(
      id: "technology",
      title: "Technology",
      image: AppAssets.technologyDark,
    ),
    CategoryDataModel(
      id: "entertainment",
      title: "Entertainment",
      image: AppAssets.entertainmentDark,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == null ? "Home" : selectedCategory!.id),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ImageIcon(AssetImage(AppAssets.searchIcn)),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onTap: () {
          setState(() {
            selectedCategory = null;
          });
          Navigator.pop(context);
        },
      ),
      body:
          selectedCategory == null
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Good Morning \nHere is Some News For You",
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 15),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CategoryCardWidget(
                            onTap: onCategoryClicked,
                            index: index,
                            categoryDataModel: categories[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                        itemCount: 6,
                      ),
                    ],
                  ),
                ),
              )
              : Text(selectedCategory!.id),
    );
  }

  void onCategoryClicked(CategoryDataModel categoryDataModel) {
    setState(() {
      selectedCategory = categoryDataModel;
    });
  }
}

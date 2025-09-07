import 'package:flutter/cupertino.dart';
import 'package:news_app/core/constants/assets.dart';
import 'package:news_app/core/network/api_requests.dart';
import 'package:news_app/modules/home/model/articles_list_data.dart';
import 'package:news_app/modules/home/model/category_data_model.dart';
import 'package:news_app/modules/home/model/source_data.dart';

class HomeViewModel extends ChangeNotifier {
  CategoryDataModel? _selectedCategory;

  int _currentTabIndex = 0;

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

  List<SourceData> _sourcesList = [];

  List<Articles> _articlesList = [];

  CategoryDataModel? get selectedCategory => _selectedCategory;

  int get currentTabIndex => _currentTabIndex;

  List<SourceData> get sourcesList => _sourcesList;

  List<Articles> get articlesList => _articlesList;

  void changeTabIndex(int index) {
    _currentTabIndex = index;
    getArticles(_sourcesList[index].id);
    notifyListeners();
  }

  void onCategoryClicked([CategoryDataModel? categoryDataModel]) {
    _selectedCategory = categoryDataModel;
    notifyListeners();
  }

  Future<void> getSources() async {
    try {
      _sourcesList = await ApiRequests.getSources(_selectedCategory!.id);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getArticles(String sourceId) async {
    try {
      _articlesList = await ApiRequests.getArticles(sourceId);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}

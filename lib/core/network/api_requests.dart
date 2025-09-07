import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/network/api_constants.dart';
import 'package:news_app/core/network/end_points.dart';
import 'package:news_app/modules/home/model/articles_list_data.dart';
import 'package:news_app/modules/home/model/source_data.dart';

abstract class ApiRequests {
  static Future<List<SourceData>> getSources(String categoryId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": ApiConstants.apiKey,
      "category": categoryId,
    };
    final response = await http.get(
      Uri.https(ApiConstants.baseUrl, Endpoints.getSources, queryParameters),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      SourcesListData sourcesListData = SourcesListData.fromJson(data);

      return sourcesListData.sources;
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<List<Articles>> getArticles(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
    };
    final response = await http.get(
      Uri.https(ApiConstants.baseUrl, Endpoints.getArticles, queryParameters),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      ArticlesListData articlesListData = ArticlesListData.fromJson(data);
      return articlesListData.articles ?? [];
    } else {
      throw Exception("Failed to load data");
    }
  }
}

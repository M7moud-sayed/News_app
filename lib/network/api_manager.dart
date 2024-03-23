import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchDataSource(String categoryId) async {
    Map<String, dynamic> queryParams = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri url =
        Uri.https(Constants.baseUrl, "/v2/top-headlines/sources", queryParams);

    final response = await http.get(url);
    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List sourceList = data["sources"];
      for (var element in sourceList) {
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    } else {
      throw Exception("failed to load");
    }
  }

  static Future<List<ArticleModel>> fetchDataArticles(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };

    Uri url = Uri.https(Constants.baseUrl, "/v2/everything", queryParameters);
    var response = await http.get(url);

    List<ArticleModel> articlesList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List articles = data["articles"];
      for (var element in articles) {
        articlesList.add(ArticleModel.fromJson(element));
      }
      return articlesList;
    } else {
      throw Exception("Error Fetch Data Articles");
    }
  }
}

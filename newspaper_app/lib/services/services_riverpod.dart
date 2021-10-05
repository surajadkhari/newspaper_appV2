import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:newspaper_app/model/news_mode.dart';

class Db {
  NewsModel reuseableArticles;

  Future<NewsModel> fetchNews() async {
    var endPoint =
        "https://newsapi.org/v2/everything?q=Apple&from=2021-09-12&sortBy=popularity&apiKey=827dea572df845ea9be0bd26e85f0746";
    var response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      NewsModel newsData = newsModelFromJson(response.body);
      reuseableArticles = newsData;
      return newsData;
    } else {
      return null;
    }
  }
}

final networkdataserviceProvider = Provider<Db>((ref) => Db());

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/part5/news.dart';
import 'package:news_app/part5/request_state.dart';

class NewsRepository {
  final Dio _dio;

  NewsRepository(this._dio);

  Future<RequestState<List<News>>> getNews() async {
    try {
      // throw Exception("Something went wrong");
      final response = await _dio.get('https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=us&max=10&apikey=07d7eb78ed57bf2d790d301d4d0c6f7f');
      final news = (response.data['articles'] as List).map((e)=> News.fromJson(e)).toList();

      return RequestStateSuccess(news);
    } catch(e) {
      // print("Error fetching news: $e");
      debugPrint(e.toString());
      return RequestStateError(e.toString());
    }
  }
}
import 'package:flutter/material.dart';
import 'package:news_app/part5/news.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News news;
  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(news.imageUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.title, style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.description),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(news.content),
                ),
              ],
            )
          )
      ),
    );
  }
}
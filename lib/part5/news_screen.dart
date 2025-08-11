import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/part5/bloc.dart';
import 'package:news_app/part5/event.dart';
import 'package:news_app/part5/news.dart';
import 'package:news_app/part5/news_details_screen.dart';
import 'package:news_app/part5/news_repository.dart';
import 'package:news_app/part5/request_state.dart';
import 'package:news_app/part5/state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
          BlocProvider(
            create: (_) => NewsScreenBloc(NewsRepository(Dio()))..add(LoadNewsEvent()),
            child: BlocBuilder<NewsScreenBloc, NewsScreenState>(builder: (context, state) {
              final newsListRequestState = state.newsListRequestState;
              return switch(newsListRequestState) {
                RequestStateInitial<List<News>>() => Text("Nothing has happened"),
                RequestStateSuccess<List<News>>() => _buildNews(context, newsListRequestState.data),
                RequestStateLoading<List<News>>() => Center(child: CircularProgressIndicator()),
                RequestStateError<List<News>>() => Column(
                  children: [
                    Text(
                      newsListRequestState.message,
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<NewsScreenBloc>().add(LoadNewsEvent());
                      },
                      child: Text("Retry"),
                    ),
                  ],
                ),
              };
            }),
          )
      ),
    );
  }

  Widget _buildNews(BuildContext context, List<News> newsList) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NewsScreenBloc>().add(LoadNewsEvent());
      },
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        padding: EdgeInsets.all(8),
        itemCount: newsList.length,
        itemBuilder: (context,index) {
          return _buildNewsItem(context, newsList[index], () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => NewsDetailsScreen(news: newsList[index])));
          });
        },
      ),
    );
  }

  Widget _buildNewsItem(BuildContext context, News news, VoidCallback onTap) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
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
          ],
        ),
      ),
    );
  }
}
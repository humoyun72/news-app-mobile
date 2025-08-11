import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/part5/event.dart';
import 'package:news_app/part5/news.dart';
import 'package:news_app/part5/state.dart';

class NewsScreenBloc extends Bloc<NewsScreenEvent, NewsScreenState> {
  NewsScreenBloc(): super(NewsScreenState()) {
    on<LoadNewsEvent>(_onLoadNews);
  }

  Future<void> _onLoadNews(
      LoadNewsEvent event,
      Emitter<NewsScreenState> emit
  ) async {
    final newState = NewsScreenState(
      newsList: state.newsList,
      isLoading: true,
    );
    emit(newState);

    await Future.delayed(Duration(seconds: 3));

    final newState2 = NewsScreenState(
      newsList: List.generate(10, (index) => News(title: "News no: $index")),
      isLoading: false,
    );

    emit(newState2);
  }
}
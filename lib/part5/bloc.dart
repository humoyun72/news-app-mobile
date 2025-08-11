import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/part5/event.dart';
import 'package:news_app/part5/news.dart';
import 'package:news_app/part5/news_repository.dart';
import 'package:news_app/part5/request_state.dart';
import 'package:news_app/part5/state.dart';

class NewsScreenBloc extends Bloc<NewsScreenEvent, NewsScreenState> {
  final NewsRepository _newsRepository;

  NewsScreenBloc(this._newsRepository): super(NewsScreenState()) {
    on<LoadNewsEvent>(_onLoadNews);
  }

  Future<void> _onLoadNews(
      LoadNewsEvent event,
      Emitter<NewsScreenState> emit
  ) async {
    emit(state.copyWith(
      newsListRequestState: const RequestStateLoading(),
    ));

    final response = await _newsRepository.getNews();

    emit(state.copyWith(
      newsListRequestState: response,
    ));
  }
}
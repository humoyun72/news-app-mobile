import 'package:news_app/part5/news.dart';
import 'package:news_app/part5/request_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'state.g.dart';

@CopyWith()
class NewsScreenState {
  final RequestState<List<News>> newsListRequestState;

  NewsScreenState({
    this.newsListRequestState = const RequestStateInitial(),
  });



  // NewsScreenState copyWith({
  //   RequestState<List<News>>? newsListRequestState,
  // }) {
  //   return NewsScreenState(
  //     newsListRequestState: newsListRequestState ?? this.newsListRequestState,
  //   );
  //
  // }
}
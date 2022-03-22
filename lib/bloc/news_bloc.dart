import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pantau_covid/models/models.dart';
import 'package:flutter_pantau_covid/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNews>((event, emit) async {
      NewsModel news = await NewsService.getNews();
      emit(NewsLoaded(news: news));
    });

    on<LoadingNews>((event, emit) {
      emit(NewsInitial());
    });
  }
}

part of 'get_news_cubit.dart';

@immutable
abstract class GetNewsState {}

class GetNewsInitial extends GetNewsState {}

class GetNewsLoading extends GetNewsState {}

class GetNewsSuccess extends GetNewsState {
  final GetNewsModel ourNewsData;

  GetNewsSuccess(this.ourNewsData);
}

class GetNewsError extends GetNewsState {}

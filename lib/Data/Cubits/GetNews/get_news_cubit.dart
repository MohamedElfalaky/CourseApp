import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quizz_app/Data/Models/get_news_model/get_news_model.dart';
import 'package:quizz_app/Data/Repositries/get_news_repo.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());

  GetNewsRepo getNewsRepo = GetNewsRepo();

  getMyNews() {
    emit(GetNewsLoading());

    getNewsRepo.getNews().then((valuee) {
      if (valuee != null) {
        emit(GetNewsSuccess(valuee));
      } else {
        emit(GetNewsError());
      }
    });
  }
}

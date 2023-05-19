import 'dart:convert';

import 'package:quizz_app/Data/Models/get_news_model/get_news_model.dart';
import 'package:http/http.dart' as http;

class GetNewsRepo {
  Future<GetNewsModel?> getNews() async {
    try {
      var response = await http.get(Uri.parse(
          "tps://api.themoviedb.org/3/account/{account_id}/rated/movies"));

      Map<String, dynamic> responseMap = json.decode(response.body);

      if (response.statusCode == 200) {
        // print("The API Request Done Successfully");
        final data = GetNewsModel.fromJson(responseMap);

        return data;
      } else {
        // print("Failed");

        return null;
      }
    } catch (error) {
      return null;
    }
  }
}

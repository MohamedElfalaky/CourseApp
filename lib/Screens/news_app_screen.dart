import 'package:flutter/material.dart';
import 'package:quizz_app/Data/Models/get_news_model/get_news_model.dart';
import 'package:quizz_app/Data/Repositries/get_news_repo.dart';

import '../Widgets/news_card.dart';

class NewsAppScreenWithSetState extends StatefulWidget {
  const NewsAppScreenWithSetState({super.key});

  @override
  State<NewsAppScreenWithSetState> createState() =>
      _NewsAppScreenWithSetStateState();
}

class _NewsAppScreenWithSetStateState extends State<NewsAppScreenWithSetState> {
  bool? isDataReceived = false;
  GetNewsModel? ourData;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: Text("Get News"),
                    onPressed: () {
                      setState(() {
                        isDataReceived = null;
                      });

                      GetNewsRepo().getNews().then((myValue) {
                        if (myValue != null) {
                          setState(() {
                            isDataReceived = true;
                          });

                          ourData = myValue;
                        } else {}
                      });
                    },
                  ),
                ),
                Expanded(
                  child: isDataReceived == true
                      ? ListView.builder(
                          itemBuilder: (context, index) => NewsCard(
                            imagee: ourData!.articles![index].urlToImage,
                            titlee: ourData!.articles![index].title,
                            datee: ourData!.articles![index].publishedAt,
                          ),
                          itemCount: ourData!.articles!.length,
                        )
                      : isDataReceived == false
                          ? Center(
                              child: Text("No data"),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                ),
              ],
            )),
      ),
    );
  }
}

/// JSON object
///
///  Java Script Object Notation

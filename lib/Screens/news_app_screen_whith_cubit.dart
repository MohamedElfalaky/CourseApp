import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/Data/Cubits/GetNews/get_news_cubit.dart';

import '../Widgets/news_card.dart';

class NewsAppScreenWithCubit extends StatefulWidget {
  const NewsAppScreenWithCubit({super.key});

  @override
  State<NewsAppScreenWithCubit> createState() => _NewsAppScreenWithCubitState();
}

class _NewsAppScreenWithCubitState extends State<NewsAppScreenWithCubit> {
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
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    child: const Text("Get News"),
                    onPressed: () {
                      BlocProvider.of<GetNewsCubit>(context).getMyNews();
                    },
                  ),
                ),
                Expanded(
                  child: Center(child: BlocBuilder<GetNewsCubit, GetNewsState>(
                    builder: (context, state) {
                      if (state is GetNewsInitial) {
                        return const Text(
                            "This is the initial state, please hit the button to get your data");
                      } else if (state is GetNewsLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is GetNewsSuccess) {
                        return ListView.builder(
                          itemBuilder: (context, index) => NewsCard(
                            imagee:
                                state.ourNewsData.articles![index].urlToImage,
                            titlee: state.ourNewsData.articles![index].title,
                            datee:
                                state.ourNewsData.articles![index].publishedAt,
                          ),
                          itemCount: state.ourNewsData.articles!.length,
                        );
                      } else {
                        return const Text("Erorr");
                      }
                    },
                  )),
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

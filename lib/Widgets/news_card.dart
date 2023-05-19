import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  String? imagee;
  String? titlee;
  String? datee;
  NewsCard({super.key, this.imagee, this.titlee, this.datee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 227, 226, 220).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
      height: 120,
      child: Row(
        // mainAxisSize: MainAxisSize.min,/
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                // imagee == null?
                // "https://a-z-animals.com/media/tiger_laying_hero_background.jpg": imagee!,
                imagee ??
                    "https://a-z-animals.com/media/tiger_laying_hero_background.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    titlee ?? "No title for this news",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    datee ?? "date not available",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

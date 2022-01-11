import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final data;

  const PostDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Rainbow',
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
              ),
              Text(
                'News',
                style: TextStyle(letterSpacing: 1.2, color: Colors.blue),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .06),
            child: Text(
              data["title"]["rendered"],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .02,
              horizontal: MediaQuery.of(context).size.width * .04,
            ),
            child: Image.network(
              data["_embedded"]["wp:featuredmedia"][0]["source_url"],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .06,
            ),
            child: Text(
              data["content"]["rendered"]
                  .toString()
                  .replaceAll(RegExp(r'<[^>]*>'), ''),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}

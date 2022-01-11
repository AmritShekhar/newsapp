import 'package:flutter/material.dart';
import 'package:rainbownews/screens/postdetail.dart';
import 'package:rainbownews/services/edpost.dart';

class EduPost extends StatefulWidget {
  const EduPost({Key? key}) : super(key: key);

  @override
  _EduPostState createState() => _EduPostState();
}

class _EduPostState extends State<EduPost> {
  EdPost edPostService = EdPost();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: FutureBuilder<List>(
        future: edPostService.getEdPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.length == 0) {
              return const Center(
                child: Text("No Post Available"),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .04,
                    vertical: MediaQuery.of(context).size.height * .01,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2.0,
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              snapshot.data![index]["_embedded"]
                                  ["wp:featuredmedia"][0]["source_url"],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .03),
                            child: Text(
                              snapshot.data![index]["title"]["rendered"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetail(
                            data: snapshot.data?[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

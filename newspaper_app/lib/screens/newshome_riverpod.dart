import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspaper_app/model/news_mode.dart';
import 'package:newspaper_app/providers/providers.dart';
import 'package:newspaper_app/services/services_riverpod.dart';

import 'newsdetail_riverpod.dart';

class NewsHomepage extends StatefulWidget {
  const NewsHomepage({Key key}) : super(key: key);

  @override
  _NewsHomepageState createState() => _NewsHomepageState();
}

class _NewsHomepageState extends State<NewsHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Top News",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                return watch(dataProvider).when(
                  data: (value) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.articles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => newsDetailPage(
                                        index: index,
                                      )));
                            },
                            child: Container(
                              width: 200,
                              margin: EdgeInsets.all(12.0),
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3.0,
                                    ),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      //let's add the height

                                      image: DecorationImage(
                                          image: NetworkImage(
                                              value.articles[index].urlToImage),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Text(
                                      value.articles[index].source.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    // "${snapshot.data.articles[index].title} hasfjhsafhashfpiashfiashfpjasnfnsakfnas",
                                    value.articles[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (Object error, StackTrace stackTrace) {
                    return Text('error');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

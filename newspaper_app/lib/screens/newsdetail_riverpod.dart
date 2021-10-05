import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newspaper_app/model/news_mode.dart';
import 'package:newspaper_app/services/services_riverpod.dart';

class newsDetailPage extends StatefulWidget {
  const newsDetailPage({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _newsDetailPageState createState() => _newsDetailPageState();
}

class _newsDetailPageState extends State<newsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var km = watch(networkdataserviceProvider).reuseableArticles.articles;
      return Scaffold(
        appBar: AppBar(
          title: Text(km[widget.index].title),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(km[widget.index].urlToImage),
                  )),
            )),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text(
                    km[widget.index].source.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 360,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    km[widget.index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(km[widget.index].description),
              ),
            )
          ],
        ),
      );
    });
  }
}

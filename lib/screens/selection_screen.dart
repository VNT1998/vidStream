import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class SelectionScreen extends StatelessWidget {
  final List<Content> list;
  final String listName;

  const SelectionScreen({Key key, @required this.list, @required this.listName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          listName,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(list[index].imageUrl))),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Title:  NetFlixPro",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "Version: 1.0.0",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "Author:  V---N---T",
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

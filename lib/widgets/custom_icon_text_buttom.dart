import 'package:flutter/material.dart';

class CustomIconTextButton extends StatelessWidget {
  final String title;
  final IconData iconName;
  final Function onPrssed;
  const CustomIconTextButton(
      {Key key, @required this.title, @required this.iconName, this.onPrssed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.white24, blurRadius: 60, spreadRadius: 1)
      ]
          // gradient: LinearGradient(colors: [
          //   Colors.black.withOpacity(0.01),
          //   Colors.white.withOpacity(0.2),
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            side: BorderSide(width: 0, color: Colors.white),
            elevation: 10.0),
        //padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
        onPressed: () => print(title),
        //color: Colors.white,
        icon: Icon(
          iconName,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

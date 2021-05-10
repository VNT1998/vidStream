import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

class SelectionScreen extends StatelessWidget {
  final List<Content> list;
  final String listName;
  static const routeName = '/selectionScreen';
  const SelectionScreen({Key key, @required this.list, @required this.listName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive(
        mobile: SelectionScreenMobile(
          list: list,
          listName: listName,
        ),
        desktop: SelectionScreenDesktop(
          list: list,
          listName: listName,
        ),
      ),
    );
  }
}

class SelectionScreenMobile extends StatelessWidget {
  final List<Content> list;
  final String listName;
  static const routeName = '/selectionScreen';

  const SelectionScreenMobile({Key key, this.list, this.listName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    void goHome(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        routeName,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => goHome(context),
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 20.0,
        child: Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black,
        title: Text(
          listName,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: GridView.builder(
          itemCount: list.length,
          padding: EdgeInsets.all(2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.5,
            // crossAxisSpacing: 0,
            // mainAxisSpacing: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              width: 130,
              //padding: EdgeInsets.all(),
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  image: DecorationImage(
                      image: AssetImage(list[index].imageUrl),
                      fit: BoxFit.cover)),
            );
          }),
    );
  }
}

class SelectionScreenDesktop extends StatelessWidget {
  final List<Content> list;
  final String listName;
  static const routeName = '/selectionScreen';

  const SelectionScreenDesktop({Key key, this.list, this.listName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    void goHome(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        routeName,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => goHome(context),
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 20.0,
        child: Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black,
        title: Text(
          listName,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: GridView.builder(
          itemCount: list.length,
          padding: EdgeInsets.all(2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 0.5,
            // crossAxisSpacing: 0,
            // mainAxisSpacing: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              width: 130,
              //padding: EdgeInsets.all(),
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  image: DecorationImage(
                      image: AssetImage(list[index].imageUrl),
                      fit: BoxFit.cover)),
            );
          }),
    );
  }
}

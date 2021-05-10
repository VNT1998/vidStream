import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';
import 'package:flutter_netflix_responsive_ui/screens/selection_screen.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: CustomAppBarDesktop(),
        ));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void selectTVScreen(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return SelectionScreen(list: originals, listName: "TV Shows");
      }));
    }

    void selectMovieScreen(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return SelectionScreen(list: alldata, listName: "Movies");
      }));
    }

    void selectMyListScreen(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return SelectionScreen(list: myList1, listName: "My List");
      }));
    }

    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () => selectTVScreen(context),
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () => selectMovieScreen(context),
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () => selectMyListScreen(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBarDesktop extends StatelessWidget {
  static const routeName = '/search';

  void goSearch(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    void selectTVScreen(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return SelectionScreen(list: originals, listName: "TV Shows");
      }));
    }

    void selectMovieScreen(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return SelectionScreen(list: alldata, listName: "Movies");
      }));
    }

    void selectMyListScreen(BuildContext ctx) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
        return SelectionScreen(list: myList1, listName: "My List");
      }));
    }

    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // _AppBarButton(
                //   title: "Home",
                //   onTap: () =>) ,
                // ),
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () => selectTVScreen(context),
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () => selectMovieScreen(context),
                ),
                _AppBarButton(
                  title: "Latest",
                  onTap: () => print("Latest"),
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () => selectMyListScreen(context),
                ),
              ],
            ),
          ),
          const Spacer(),
          // const SizedBox(
          //   width: 400.0,
          // ),
          Expanded(
            child:
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [

                // _AppBarButton(
                //   title: "KIDS",
                //   onTap: () => print("TV Show"),
                // ),
                // _AppBarButton(
                //   title: "DVD",
                //   onTap: () => print("TV Show"),
                // ),
                // IconButton(
                //   padding: EdgeInsets.zero,
                //   icon: Icon(Icons.card_giftcard),
                //   iconSize: 28.0,
                //   color: Colors.white,
                //   onPressed: () => print("Gift"),
                // ),
                // IconButton(
                //   padding: EdgeInsets.zero,
                //   icon: Icon(Icons.notifications),
                //   iconSize: 28.0,
                //   color: Colors.white,
                //   onPressed: () => print("Notifications"),
                // ),
                Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.search),
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () => goSearch(context),
              ),
            ),
          )
          //   ],
          // ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key key, @required this.title, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }
}

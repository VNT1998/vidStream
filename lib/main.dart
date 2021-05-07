import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/custom_app_bar.dart';
import './screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false, //removing the debug banner at the top
      theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(color: Colors.white),
                bodyText1: TextStyle(color: Colors.white),
                headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                headline5: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                headline4: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )),
      // home: NavScreen(),
      routes: {
        '/': (ctx) => NavScreen(),
        SearchScreen.routeName: (ctx) => NavScreen(),
        // Previews.routeName: (ctx) => VPlayer(),
      },
    );
  }
}

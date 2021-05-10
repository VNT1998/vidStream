import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;
  final List<Content> data1;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
    @required this.data1,
  }) : super(key: key);

  void selectPreview(
      BuildContext ctx, String vUrl, String vName, String imageUrl) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return VPlayer(
            videoURL: vUrl,
            videoName: vName,
            imageURL: imageUrl,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayData = [];
    List<String> temp1 = [];
    List<String> temp2 = [];
    List<String> temp3 = [];
    List<String> temp4 = [];

    var indexImage = 0;
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
              color: Colors.white,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }

    for (var i = 0; i < data1.length; i++) {
      final Content temp = data1[i];
      temp1.add(temp.name.toLowerCase());
      temp2.add(temp.imageUrl);
      temp3.add(temp.videoUrl);
      temp4.add(temp.description);
    }
    for (var i = 0; i < temp1.length; i++) {
      if (temp1.contains(searchTerm)) {
        displayData.add(searchTerm.toUpperCase());
        indexImage = temp1.indexOf(searchTerm);
        //print(i.toString() + displayData[i]);
        return Container(
          //color: Colors.grey.withOpacity(0.1),
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: displayData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  //color: Colors.grey.withOpacity(0.1),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => selectPreview(
                                context,
                                temp3[indexImage],
                                displayData[index],
                                temp2[indexImage]),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              height: 200,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                image: DecorationImage(
                                  image: AssetImage(temp2[indexImage]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${displayData[index]}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Text(temp4[index])),
                    ],
                  ),
                );
              }),
        );
      } else {
        return Center(
          child: Text(
            'Search result not found',
            style: Theme.of(context).textTheme.headline5,
          ),
        );
      }
    }
  }
}

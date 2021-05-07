import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  //static const routeName = '/video';

  const Previews({Key key, this.title, this.contentList}) : super(key: key);

  void selectPreview(BuildContext ctx, String vUrl, String vName) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return VPlayer(
            videoURL: vUrl,
            videoName: vName,
          );
        },
      ),
    );
  }
  // void selectPreview(BuildContext ctx, String vUrl, String vName) {
  //   Navigator.of(ctx).pushNamed(
  //     routeName,
  //     arguments: {'videoUrl': vUrl, 'videoName': vName},
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext content, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                    onTap: () =>
                        selectPreview(context, content.videoUrl, content.name),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: content.color, width: 4.0),
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent,
                              ],
                              stops: [0, 0.25, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: content.color, width: 4.0),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 70.0,
                            child: Center(
                              child: Text(content.name,
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            // child: Image.asset(content.titleImageUrl),
                          ),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(featuredContent.imageUrl),
            fit:BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
